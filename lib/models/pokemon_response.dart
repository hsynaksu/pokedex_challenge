import 'package:pokedex_challenge/models/pokemon.dart';

class PokemonResponse {
  final List<Pokemon> pokemonList;
  final int totalPokemon;

  PokemonResponse({required this.pokemonList, required this.totalPokemon});

  factory PokemonResponse.fromJson(Map<String, dynamic> data) {
    final pokemonListJson = data["allPokemon"] as List<dynamic>;
    final pageInfoJson = data["pageInfo"];

    final pokemonList = pokemonListJson.map((pokemonJson) => Pokemon.fromJson(pokemonJson as Map<String, dynamic>));
    final totalCount = pageInfoJson["totalPokemons"]["count"] as int;

    return PokemonResponse(pokemonList: pokemonList.toList(), totalPokemon: totalCount);
  }
}
