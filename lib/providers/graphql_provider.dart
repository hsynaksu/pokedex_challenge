import 'package:hasura_connect/hasura_connect.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'graphql_provider.g.dart';

@Riverpod(keepAlive: true)
HasuraConnect graphQlClient(GraphQlClientRef ref) {
  final graphQl = HasuraConnect('https://beta.pokeapi.co/graphql/v1beta');

  return graphQl;
}
