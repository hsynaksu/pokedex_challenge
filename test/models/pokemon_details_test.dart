import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_challenge/models/pokemon_details.dart';

import 'pokemon_details_json.dart';

void main() {
  test("PokemonDetails .jsonParse works correctly", () {
    final pokemonDetails = PokemonDetails.fromJson(jsonDecode(pokemonDetailsJson) as Map<String, dynamic>);

    // PokemonDetails fields converted correctly
    expect(pokemonDetails.flavorText, "Test flavor text");
    expect(pokemonDetails.height, 7);
    expect(pokemonDetails.weight, 69);
    expect(pokemonDetails.abilities.length, 2);
    expect(pokemonDetails.abilities[0], "Overgrow");
    expect(pokemonDetails.stats.length, 6);

    // PokemonStat fields converted correctly
    expect(pokemonDetails.stats[0].name, "HP");
    expect(pokemonDetails.stats[0].value, 45);
  });
}
