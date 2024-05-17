// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_filter_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchPokemonTypesHash() => r'9cb7e05d39f012820eff53b214852bac535f8242';

/// See also [fetchPokemonTypes].
@ProviderFor(fetchPokemonTypes)
final fetchPokemonTypesProvider = FutureProvider<List<PokemonType>>.internal(
  fetchPokemonTypes,
  name: r'fetchPokemonTypesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchPokemonTypesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchPokemonTypesRef = FutureProviderRef<List<PokemonType>>;
String _$typeFilterHash() => r'57b96a4f73e088fe52bca77dabad350a1e976ecc';

/// See also [TypeFilter].
@ProviderFor(TypeFilter)
final typeFilterProvider =
    AutoDisposeNotifierProvider<TypeFilter, PokemonType?>.internal(
  TypeFilter.new,
  name: r'typeFilterProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$typeFilterHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TypeFilter = AutoDisposeNotifier<PokemonType?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
