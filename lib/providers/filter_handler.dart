import 'package:pokedex_challenge/models/pokemon_filter.dart';
import 'package:pokedex_challenge/models/pokemon_type.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_handler.g.dart';

@riverpod
class FilterHandler extends _$FilterHandler {
  @override
  PokemonFilter build() => PokemonFilter();

  void selectName(String name) => state = state.copyWith(name: name);

  void clearName() => state = PokemonFilter(type: state.type);

  void selectType(PokemonType type) => state = state.copyWith(type: type);

  void clearType() => state = PokemonFilter(name: state.name);
}
