import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:pokedex_challenge/data/repoository/pokemon_repository.dart';
import 'package:pokedex_challenge/models/pokemon.dart';
import 'package:pokedex_challenge/models/pokemon_details.dart';
import 'package:pokedex_challenge/models/pokemon_stat.dart';
import 'package:pokedex_challenge/models/pokemon_type.dart';
import 'package:pokedex_challenge/presentation/details/details_page.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {
  @override
  Future<PokemonDetails> fetchPokemonDetails(int pokemonId) {
    return Future.value(PokemonDetails(
      flavorText: "flavorText",
      height: 10,
      weight: 20,
      abilities: ["a", "b"],
      stats: [
        PokemonStat(name: "HP", value: 100),
        PokemonStat(name: "Str", value: 100),
      ],
    ));
  }
}

void main() {
  group("Details Page", () {
    late MockPokemonRepository mockRepository;
    late Pokemon testPokemon;

    setUp(() {
      mockRepository = MockPokemonRepository();
      testPokemon = Pokemon(
        id: 1,
        name: "Balbasaur",
        types: [PokemonType(id: 1, name: "Grass")],
        defaultSpriteUrl: "",
      );
    });

    testWidgets('shows ready pokemon information as soon as page opens', (tester) async {
      await mockNetworkImages(
        () async => tester.pumpWidget(
          ProviderScope(
            overrides: [
              pokemonRepositoryProvider.overrideWithValue(mockRepository),
            ],
            child: MaterialApp(
              home: DetailsPage(pokemon: testPokemon),
            ),
          ),
        ),
      );

      expect(find.text("Balbasaur #1"), findsOneWidget);
      expect(find.text("Grass"), findsOneWidget);
    });

    testWidgets('shows loading and loads pokemon details', (tester) async {
      await mockNetworkImages(
        () async => tester.pumpWidget(
          ProviderScope(
            overrides: [
              pokemonRepositoryProvider.overrideWithValue(mockRepository),
            ],
            child: MaterialApp(
              home: DetailsPage(pokemon: testPokemon),
            ),
          ),
        ),
      );

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.text("flavorText"), findsOneWidget);
      expect(find.text("Height: 100 cm  Weigth: 2.0 kg"), findsOneWidget);
      // 2 for abilities, 1 for type
      expect(find.byType(Chip), findsExactly(3));
      // Linear progress indicators for stat values
      expect(find.byType(LinearProgressIndicator), findsExactly(2));
    });
  });
}
