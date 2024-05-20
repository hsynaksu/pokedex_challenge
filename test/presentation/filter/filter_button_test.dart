import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_challenge/models/pokemon_type.dart';
import 'package:pokedex_challenge/presentation/filter/filter_button.dart';
import 'package:pokedex_challenge/presentation/filter/filter_modal.dart';
import 'package:pokedex_challenge/providers/filter_handler.dart';

void main() {
  group("Filter Button", () {
    testWidgets('initially has no type selected', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: FilterButton(),
            ),
          ),
        ),
      );

      expect(find.text("Type"), findsOneWidget);
    });

    testWidgets('opens FilterModal when tapped with no type selected', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: FilterButton(),
            ),
          ),
        ),
      );

      await tester.tap(find.byType(FilterButton));
      await tester.pumpAndSettle();

      expect(find.byType(FilterModal), findsOneWidget);
    });

    testWidgets('shows selected type if there is one selected', (tester) async {
      final testFilterHandler = FilterHandler();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            filterHandlerProvider.overrideWith(() => testFilterHandler),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: FilterButton(),
            ),
          ),
        ),
      );

      testFilterHandler.selectType(PokemonType(name: "Test", id: 1));
      await tester.pumpAndSettle();

      expect(find.text("Test"), findsOneWidget);
    });

    testWidgets('clicking button when type is selected clears type', (tester) async {
      final testFilterHandler = FilterHandler();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            filterHandlerProvider.overrideWith(() => testFilterHandler),
          ],
          child: const MaterialApp(
            home: Scaffold(
              body: FilterButton(),
            ),
          ),
        ),
      );

      testFilterHandler.selectType(PokemonType(name: "Test", id: 1));
      await tester.pumpAndSettle();
      expect(find.text("Test"), findsOneWidget);

      await tester.tap(find.byType(FilterButton));
      await tester.pumpAndSettle();
      expect(find.text("Type"), findsOneWidget);
    });
  });
}
