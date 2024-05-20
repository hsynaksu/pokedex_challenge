import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_challenge/data/repoository/pokemon_repository.dart';
import 'package:pokedex_challenge/models/pokemon_type.dart';
import 'package:pokedex_challenge/presentation/filter/filter_modal.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {
  @override
  Future<List<PokemonType>> fetchPokemonTypes() {
    return Future.value([
      PokemonType(id: 1, name: "Type 1"),
      PokemonType(id: 2, name: "Type 2"),
      PokemonType(id: 3, name: "Type 3"),
    ]);
  }
}

void main() {
  group("Filter Modal", () {
    testWidgets('shows loading and then all pokemon types', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            pokemonRepositoryProvider.overrideWithValue(MockPokemonRepository()),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: FilterModal(),
            ),
          ),
        ),
      );

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.byType(ActionChip), findsExactly(3));
      expect(find.text("Type 1"), findsOneWidget);
      expect(find.text("Type 2"), findsOneWidget);
      expect(find.text("Type 3"), findsOneWidget);
    });

    testWidgets('tapping on type closes the modal', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            pokemonRepositoryProvider.overrideWithValue(MockPokemonRepository()),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: FilterModal(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.text("Type 1"));

      await tester.pumpAndSettle();

      expect(find.byType(FilterModal), findsNothing);
    });
  });
}
