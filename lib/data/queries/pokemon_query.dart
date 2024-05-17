import 'package:pokedex_challenge/models/pokemon_type.dart';

const String pokemonQuery = """
  query pokemonQuery(\$limit: Int, \$offset: Int, \$filter: pokemon_v2_pokemon_bool_exp) {
    allPokemon: pokemon_v2_pokemon(limit: \$limit, offset: \$offset, where: \$filter) {
      id
      name
      types: pokemon_v2_pokemontypes {
        type: pokemon_v2_type {
          id
          name
        }
      }
      sprites: pokemon_v2_pokemonsprites {
        sprites
      }
    }
    pageInfo: pokemon_v2_pokemon_aggregate(where: \$filter) {
      totalPokemons: aggregate {
        count
      }
    }
  }
""";

Map<String, dynamic> getPokemonVariables({required int limit, required int offset, String? name, PokemonType? type}) {
  Map<String, dynamic> filter = {};
  filter.addAll(getNameFilter(name));
  filter.addAll(getTypeFilter(type?.id));

  Map<String, dynamic> variables = {
    "limit": limit,
    "offset": offset,
    "filter": {
      "pokemon_v2_pokemontypes": {
        "pokemon_v2_pokemon": filter,
      }
    }
  };

  return variables;
}

Map<String, dynamic> getNameFilter(String? name) {
  return name != null
      ? {
          "name": {"_eq": name}
        }
      : {};
}

Map<String, dynamic> getTypeFilter(int? typeId) {
  return typeId != null
      ? {
          "pokemon_v2_pokemontypes": {
            "pokemon_v2_type": {
              "id": {"_eq": typeId}
            }
          }
        }
      : {};
}
