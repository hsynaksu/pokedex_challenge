import 'package:pokedex_challenge/models/pokemon_stat.dart';

class PokemonDetails {
  final String flavorText;
  final int height;
  final int weight;
  final List<String> abilities;
  final List<PokemonStat> stats;

  PokemonDetails({
    required this.flavorText,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.stats,
  });

  factory PokemonDetails.fromJson(Map<String, dynamic> details) {
    final height = details["height"] as int;
    final weight = details["weight"] as int;

    final species = details["pokemon_v2_pokemonspecy"];
    final specyAggragate = species["pokemon_v2_pokemonspeciesflavortexts_aggregate"];
    final nodeList = (specyAggragate["nodes"] ?? []) as List<dynamic>;
    final flavorText = nodeList.isNotEmpty ? nodeList.first["flavor_text"] as String : "";

    final abilitiesList = (details["pokemon_v2_pokemonabilities"] ?? []) as List<dynamic>;
    final abilitiesNames = abilitiesList.map((a) {
      final nameList = (a["pokemon_v2_ability"]["pokemon_v2_abilitynames"] ?? []) as List<dynamic>;
      return nameList.isEmpty ? '' : nameList.first["name"] as String;
    });

    final statsList = details["pokemon_v2_pokemonstats"] as List<dynamic>;
    final stats = statsList.map((s) => PokemonStat.fromJson(s as Map<String, dynamic>));

    return PokemonDetails(
      flavorText: flavorText,
      height: height,
      weight: weight,
      abilities: abilitiesNames.toList(),
      stats: stats.toList(),
    );
  }
}
