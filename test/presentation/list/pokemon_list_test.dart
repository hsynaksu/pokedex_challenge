import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:pokedex_challenge/data/repoository/pokemon_repository.dart';
import 'package:pokedex_challenge/models/pokemon.dart';
import 'package:pokedex_challenge/models/pokemon_filter.dart';
import 'package:pokedex_challenge/models/pokemon_response.dart';
import 'package:pokedex_challenge/models/pokemon_type.dart';
import 'package:pokedex_challenge/presentation/details/details_page.dart';
import 'package:pokedex_challenge/presentation/list/no_pokemon_found.dart';
import 'package:pokedex_challenge/presentation/list/pokemon_list.dart';
import 'package:pokedex_challenge/presentation/list/pokemon_tile.dart';
import 'package:pokedex_challenge/providers/filter_handler.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {
  @override
  Future<PokemonResponse> fetchPokemon({required int limit, required int offset, PokemonFilter? filter}) async {
    return Future.value(PokemonResponse(totalPokemon: 2, pokemonList: [
      Pokemon(id: 1, name: "Balba", types: [PokemonType(id: 1, name: "Grass")], defaultSpriteUrl: ""),
      Pokemon(id: 2, name: "Balba2", types: [PokemonType(id: 2, name: "Normal")], defaultSpriteUrl: ""),
    ]));
  }
}

class EmptyMockPokemonRepository extends Mock implements PokemonRepository {
  @override
  Future<PokemonResponse> fetchPokemon({required int limit, required int offset, PokemonFilter? filter}) async {
    return Future.value(PokemonResponse(totalPokemon: 0, pokemonList: []));
  }
}

void main() {
  group("Pokemon List", () {
    testWidgets('initially shows pokemon result', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              pokemonRepositoryProvider.overrideWithValue(MockPokemonRepository()),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: Column(children: [PokemonList()]),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(PokemonTile), findsExactly(2));
      });
    });

    testWidgets('opens DetailsPage when tapped on PokemonTile', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              pokemonRepositoryProvider.overrideWithValue(MockPokemonRepository()),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: Column(children: [PokemonList()]),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        await tester.tap(find.byType(PokemonTile).first);
        await tester.pumpAndSettle();

        expect(find.byType(DetailsPage), findsOneWidget);
      });
    });

    testWidgets('changing filter refreshes the list', (tester) async {
      final testFilterHandler = FilterHandler();

      await mockNetworkImages(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              pokemonRepositoryProvider.overrideWithValue(MockPokemonRepository()),
              filterHandlerProvider.overrideWith(() => testFilterHandler),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: Column(children: [PokemonList()]),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        testFilterHandler.selectType(PokemonType(id: 1, name: "Normal"));
        await tester.pump(Durations.short1);

        expect(find.byType(LinearProgressIndicator), findsOneWidget);
        await tester.pumpAndSettle();

        expect(find.byType(PokemonTile), findsExactly(2));
      });
    });

    testWidgets('show no pokemon info when repo returns no pokemon', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              pokemonRepositoryProvider.overrideWithValue(EmptyMockPokemonRepository()),
            ],
            child: const MaterialApp(
              home: Scaffold(
                body: Column(children: [PokemonList()]),
              ),
            ),
          ),
        );

        await tester.pumpAndSettle();
        expect(find.byType(NoPokemonFound), findsOneWidget);
      });
    });
  });
}
