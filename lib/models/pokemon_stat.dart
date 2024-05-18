class PokemonStat {
  final String name;
  final int value;

  PokemonStat({required this.name, required this.value});

  factory PokemonStat.fromJson(Map<String, dynamic> stats) {
    final value = stats["base_stat"] as int;

    final statNameList = stats["pokemon_v2_stat"]["pokemon_v2_statnames"] as List<dynamic>;
    final name = statNameList.isEmpty ? "" : statNameList.first["name"] as String;

    return PokemonStat(name: name, value: value);
  }
}
