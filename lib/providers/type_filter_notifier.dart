import 'package:pokedex_challenge/data/repoository/pokemon_repository.dart';
import 'package:pokedex_challenge/models/pokemon_type.dart';
import 'package:pokedex_challenge/providers/fetch_pokemon.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'type_filter_notifier.g.dart';

@Riverpod(keepAlive: true)
Future<List<PokemonType>> fetchPokemonTypes(FetchPokemonTypesRef ref) {
  final pokemonRepo = ref.watch(pokemonRepositoryProvider);

  return pokemonRepo.fetchPokemonTypes();
}

@riverpod
class TypeFilter extends _$TypeFilter {
  @override
  PokemonType? build() {
    // fetchPokemonProvider has keepAlive tag so user can scroll through the list
    // without fetching previous pages again.
    // I invalidate it when this provider is disposed, which happens when user navigates
    // to another page.
    ref.onDispose(() => ref.invalidate(fetchPokemonProvider));
    return null;
  }

  void selectType(PokemonType type) => state = type;

  void clearType() async {
    state = null;
    ref.invalidate(fetchPokemonProvider);
  }
}
