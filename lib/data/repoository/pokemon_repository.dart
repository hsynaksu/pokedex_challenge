import 'package:hasura_connect/hasura_connect.dart';
import 'package:pokedex_challenge/data/queries/types_query.dart';
import 'package:pokedex_challenge/data/queries/pokemon_query.dart';
import 'package:pokedex_challenge/models/pokemon_response.dart';
import 'package:pokedex_challenge/models/pokemon_type.dart';
import 'package:pokedex_challenge/utils/graphql_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pokemon_repository.g.dart';

class PokemonRepository {
  const PokemonRepository({required this.grapqlClient});
  final HasuraConnect grapqlClient;

  Future<PokemonResponse> fetchPokemon({required int limit, required int offset, PokemonType? typeFilter}) async {
    final response = await grapqlClient.query(
      pokemonQuery,
      variables: getPokemonVariables(
        limit: limit,
        offset: offset,
        type: typeFilter,
      ),
    );

    return PokemonResponse.fromJson(response['data'] as Map<String, dynamic>);
  }

  Future<List<PokemonType>> fetchPokemonTypes() async {
    final response = await grapqlClient.query(typesQuery);

    final typeList = response['data']['types'] as List<dynamic>;

    return typeList.map((typeJson) => PokemonType.fromJson(typeJson as Map<String, dynamic>)).toList();
  }
}

@Riverpod(keepAlive: true)
PokemonRepository pokemonRepository(PokemonRepositoryRef ref) => PokemonRepository(
      grapqlClient: ref.watch(graphQlClientProvider),
    );
