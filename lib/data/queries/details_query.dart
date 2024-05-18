const String detailsQuery = """
  query detailsQuery(\$id: Int!) {
    pokemonDetails: pokemon_v2_pokemon(where: {id: {_eq: \$id}}) {
      id
      name
      pokemon_species_id
      height
      weight
      pokemon_v2_pokemonspecy {
        # Get only latest version of flavor text, in english
        pokemon_v2_pokemonspeciesflavortexts_aggregate(order_by: {version_id: desc}, limit: 1, where: {language_id: {_eq: 9}}) {
          nodes {
            flavor_text
          }
        }
      }
      pokemon_v2_pokemonabilities {
        pokemon_v2_ability {
          pokemon_v2_abilitynames(where: {language_id: {_eq: 9}}) {
            name
          }
        }
      }
      pokemon_v2_pokemonstats {
        base_stat
        pokemon_v2_stat {
          pokemon_v2_statnames(where: {language_id: {_eq: 9}}) {
            name
          }
        }
      }
    }
  }
""";
