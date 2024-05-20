import 'package:pokedex_challenge/models/pokemon_type.dart';

class PokemonFilter {
  final String? name;
  final PokemonType? type;

  PokemonFilter({this.name, this.type});

  PokemonFilter copyWith({String? name, PokemonType? type}) {
    return PokemonFilter(
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }

  @override
  bool operator ==(Object other) => other is PokemonFilter && name == other.name && type == other.type;

  @override
  int get hashCode => Object.hash(name, type);
}
