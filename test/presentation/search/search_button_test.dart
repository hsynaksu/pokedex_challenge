import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_challenge/presentation/search/search_button.dart';
import 'package:pokedex_challenge/presentation/search/search_page.dart';
import 'package:pokedex_challenge/providers/filter_handler.dart';

void main() {
  group("Search Button", () {
    testWidgets('initially has no search term', (tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: Scaffold(
              body: SearchButton(),
            ),
          ),
        ),
      );

      expect(find.text("Search for a Pokemon"), findsOneWidget);
    });

    testWidgets('shows search term when provided', (tester) async {
      final testFilterHandler = FilterHandler();

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
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

      expect(find.text("Search for a Pokemon"), findsNothing);
      expect(find.text("saur"), findsOneWidget);
    });

    testWidgets('clicking button opens search page', (tester) async {
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

      expect(find.byType(SearchPage), findsOneWidget);
    });
  });
}
