// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_pokemon.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchPokemonHash() => r'2d20b0e2c74c8590bdca9547aa4c5cc38514fb27';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [fetchPokemon].
@ProviderFor(fetchPokemon)
const fetchPokemonProvider = FetchPokemonFamily();

/// See also [fetchPokemon].
class FetchPokemonFamily extends Family<AsyncValue<PokemonResponse>> {
  /// See also [fetchPokemon].
  const FetchPokemonFamily();

  /// See also [fetchPokemon].
  FetchPokemonProvider call({
    required int limit,
    required int offset,
    PokemonType? typeFilter,
  }) {
    return FetchPokemonProvider(
      limit: limit,
      offset: offset,
      typeFilter: typeFilter,
    );
  }

  @override
  FetchPokemonProvider getProviderOverride(
    covariant FetchPokemonProvider provider,
  ) {
    return call(
      limit: provider.limit,
      offset: provider.offset,
      typeFilter: provider.typeFilter,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fetchPokemonProvider';
}

/// See also [fetchPokemon].
class FetchPokemonProvider extends FutureProvider<PokemonResponse> {
  /// See also [fetchPokemon].
  FetchPokemonProvider({
    required int limit,
    required int offset,
    PokemonType? typeFilter,
  }) : this._internal(
          (ref) => fetchPokemon(
            ref as FetchPokemonRef,
            limit: limit,
            offset: offset,
            typeFilter: typeFilter,
          ),
          from: fetchPokemonProvider,
          name: r'fetchPokemonProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPokemonHash,
          dependencies: FetchPokemonFamily._dependencies,
          allTransitiveDependencies:
              FetchPokemonFamily._allTransitiveDependencies,
          limit: limit,
          offset: offset,
          typeFilter: typeFilter,
        );

  FetchPokemonProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.offset,
    required this.typeFilter,
  }) : super.internal();

  final int limit;
  final int offset;
  final PokemonType? typeFilter;

  @override
  Override overrideWith(
    FutureOr<PokemonResponse> Function(FetchPokemonRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPokemonProvider._internal(
        (ref) => create(ref as FetchPokemonRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        offset: offset,
        typeFilter: typeFilter,
      ),
    );
  }

  @override
  FutureProviderElement<PokemonResponse> createElement() {
    return _FetchPokemonProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPokemonProvider &&
        other.limit == limit &&
        other.offset == offset &&
        other.typeFilter == typeFilter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, offset.hashCode);
    hash = _SystemHash.combine(hash, typeFilter.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchPokemonRef on FutureProviderRef<PokemonResponse> {
  /// The parameter `limit` of this provider.
  int get limit;

  /// The parameter `offset` of this provider.
  int get offset;

  /// The parameter `typeFilter` of this provider.
  PokemonType? get typeFilter;
}

class _FetchPokemonProviderElement
    extends FutureProviderElement<PokemonResponse> with FetchPokemonRef {
  _FetchPokemonProviderElement(super.provider);

  @override
  int get limit => (origin as FetchPokemonProvider).limit;
  @override
  int get offset => (origin as FetchPokemonProvider).offset;
  @override
  PokemonType? get typeFilter => (origin as FetchPokemonProvider).typeFilter;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
