// Gets only pokemon names that contain given name filter
const String namesQuery = """
  query namesQuery(\$filter: pokemon_v2_pokemon_bool_exp) {
    allPokemon: pokemon_v2_pokemon(where: \$filter) {
      name
    }
  }
""";

Map<String, dynamic> getNamesQueryVariables({
  String? name,
}) {
  if (name == null) return {};
  return {
    "filter": {
      "name": {"_ilike": "%$name%"}
    }
  };
}
