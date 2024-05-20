// Gets all possible pokemon types
// to show in type fiter modal
const String typesQuery = """
  query pokemonTypesQuery {
    types: pokemon_v2_type {
      id
      name
    }
  }
""";
