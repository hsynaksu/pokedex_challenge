import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:pokedex_challenge/models/pokemon.dart';
import 'package:pokedex_challenge/models/pokemon_type.dart';
import 'package:pokedex_challenge/presentation/list/pokemon_tile.dart';

void main() {
  group("Pokemon Tile", () {
    testWidgets('shows pokemon information correctly', (tester) async {
      await mockNetworkImages(() async {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: PokemonTile(
                pokemon: Pokemon(
                  id: 123,
                  name: "Balba",
                  types: [
                    PokemonType(id: 1, name: "Grass"),
                    PokemonType(id: 2, name: "Normal"),
                  ],
                  defaultSpriteUrl: "",
                ),
              ),
            ),
          ),
        );

        expect(find.text("123"), findsOneWidget);
        expect(find.text("Balba"), findsOneWidget);
        expect(find.text("Grass"), findsOneWidget);
        expect(find.text("Normal"), findsOneWidget);
        expect(find.byType(Chip), findsExactly(2));
      });
    });
  });
}
