import 'package:hasura_connect/hasura_connect.dart';
import 'package:pokedex_challenge/data/queries/names_query.dart';
import 'package:pokedex_challenge/data/queries/types_query.dart';
import 'package:pokedex_challenge/data/queries/pokemon_query.dart';
import 'package:pokedex_challenge/models/pokemon_filter.dart';
import 'package:pokedex_challenge/models/pokemon_response.dart';
import 'package:pokedex_challenge/models/pokemon_type.dart';
import 'package:pokedex_challenge/utils/graphql_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_repository.g.dart';

class PokemonRepository {
  const PokemonRepository({required this.grapqlClient});
  final HasuraConnect grapqlClient;

  Future<PokemonResponse> fetchPokemon({required int limit, required int offset, PokemonFilter? filter}) async {
    final response = await grapqlClient.query(
      pokemonQuery,
      variables: getPokemonQueryVariables(
        limit: limit,
        offset: offset,
        name: filter?.name,
        type: filter?.type,
      ),
    );

    return PokemonResponse.fromJson(response['data'] as Map<String, dynamic>);
  }

  Future<List<PokemonType>> fetchPokemonTypes() async {
    final response = await grapqlClient.query(typesQuery);

    final typeList = response['data']['types'] as List<dynamic>;

    return typeList.map((typeJson) => PokemonType.fromJson(typeJson as Map<String, dynamic>)).toList();
  }

  Future<List<String>> fetchPokemonNames(String? nameFilter) async {
    final response = await grapqlClient.query(
      namesQuery,
      variables: getNamesQueryVariables(
        name: nameFilter,
      ),
    );

    final nameList = response['data']['allPokemon'] as List<dynamic>;
    final names = nameList.map((nameObj) => nameObj["name"] as String);

    return names.toList();
  }
}

@Riverpod(keepAlive: true)
PokemonRepository pokemonRepository(PokemonRepositoryRef ref) => PokemonRepository(
      grapqlClient: ref.watch(graphQlClientProvider),
    );
