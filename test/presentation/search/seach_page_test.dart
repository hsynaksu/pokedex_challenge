import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_challenge/data/repoository/pokemon_repository.dart';
import 'package:pokedex_challenge/presentation/search/search_button.dart';
import 'package:pokedex_challenge/presentation/search/search_page.dart';
import 'package:pokedex_challenge/providers/filter_handler.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {
  @override
  Future<List<String>> fetchPokemonNames(String? nameFilter) {
    return Future.value(["Balbasaur", "Pikachu", "Charizard"]);
  }
}

void main() {
  group("Search Page", () {
    testWidgets('initially empty', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: SearchPage(),
            ),
          ),
        ),
      );

      expect(find.byType(ListTile), findsNothing);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('after typing on text field, shows loading then results in list', (tester) async {
      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            pokemonRepositoryProvider.overrideWithValue(MockPokemonRepository()),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: SearchPage(),
            ),
          ),
        ),
      );

      await tester.enterText(find.byType(TextField), "saur");
      // wait for the duration of debounce
      await tester.pump(Durations.medium2);

      expect(find.byType(LinearProgressIndicator), findsOneWidget);
      await tester.pumpAndSettle();

      expect(find.text("saur"), findsOneWidget);
      expect(find.text("Balbasaur"), findsOneWidget);
      expect(find.text("Pikachu"), findsOneWidget);
      expect(find.text("Charizard"), findsOneWidget);
    });

    testWidgets('typing on the textfield and tapping search saves the search term and closes page', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: SearchButton(),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(SearchButton));
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextField), "saur");
      // wait for the duration of debounce
      await tester.pump(Durations.medium2);

      // simulates user tapping search button on keyboard
      await tester.testTextInput.receiveAction(TextInputAction.search);

      await tester.pumpAndSettle();

      expect(find.byType(SearchPage), findsNothing);
      expect(find.text("saur"), findsOneWidget);
    });

    testWidgets('tapping close clears current search and goes back', (tester) async {
      final testFilterHandler = FilterHandler();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            pokemonRepositoryProvider.overrideWithValue(MockPokemonRepository()),
            filterHandlerProvider.overrideWith(() => testFilterHandler),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: SearchButton(),
            ),
          ),
        ),
      );

      testFilterHandler.selectName("saur");
      await tester.pumpAndSettle();

      await tester.tap(find.byType(SearchButton));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.close));
      await tester.pumpAndSettle();

      expect(find.byType(SearchPage), findsNothing);
      expect(find.text("saur"), findsNothing);
      expect(find.text("Search for a Pokemon"), findsOneWidget);
    });

    testWidgets('tapping back goes back but does not change search', (tester) async {
      final testFilterHandler = FilterHandler();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            pokemonRepositoryProvider.overrideWithValue(MockPokemonRepository()),
            filterHandlerProvider.overrideWith(() => testFilterHandler),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: SearchButton(),
            ),
          ),
        ),
      );

      testFilterHandler.selectName("saur");
      await tester.pumpAndSettle();
      expect(find.text("saur"), findsOneWidget);

      await tester.tap(find.byType(SearchButton));
      await tester.pumpAndSettle();

      await tester.tap(find.byIcon(Icons.arrow_back));
      await tester.pumpAndSettle();

      expect(find.byType(SearchPage), findsNothing);
      expect(find.text("saur"), findsOneWidget);
    });
  });
}
