import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_challenge/models/pokemon_response.dart';

import 'pokemon_response_json.dart';

void main() {
  test("PokemonResponse .jsonParse works correctly", () {
    final pokemonResponse = PokemonResponse.fromJson(jsonDecode(pokemonReponseJson) as Map<String, dynamic>);

    // PokemonResponse fields converted correctly
    expect(pokemonResponse.totalPokemon, 1302);
    expect(pokemonResponse.pokemonList.length, 2);

    // Pokemon fields converted correctly
    final pokemon = pokemonResponse.pokemonList[0];
    expect(
      pokemon.defaultSpriteUrl,
      "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png",
    );
    expect(pokemon.id, 1);
    expect(pokemon.name, "Bulbasaur");
    expect(pokemon.types.length, 2);

    // PokemonType fields converted correctly
    expect(pokemon.types[0].id, 12);
    expect(pokemon.types[0].name, "Grass");
  });
}
