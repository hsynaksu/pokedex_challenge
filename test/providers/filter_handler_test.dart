import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pokedex_challenge/models/pokemon_filter.dart';
import 'package:pokedex_challenge/models/pokemon_type.dart';
import 'package:pokedex_challenge/providers/filter_handler.dart';

// Using mockito to keep track of when a provider notify its listeners
class Listener extends Mock {
  void call(PokemonFilter? previous, PokemonFilter value);
}

void main() {
  group("filterHandlerProvider", () {
    late ProviderContainer container;
    late Listener listener;

    setUp(() async {
      container = ProviderContainer();
      listener = Listener();
    });

    tearDown(() {
      container.dispose();
    });

    test("initializes with correct value", () {
      container.listen<PokemonFilter>(
        filterHandlerProvider,
        listener.call,
        fireImmediately: true,
      );

      verify(listener(null, PokemonFilter())).called(1);
    });

    test("changing type filter produces correct result", () {
      container.listen<PokemonFilter>(
        filterHandlerProvider,
        listener.call,
        fireImmediately: true,
      );

      final testType = PokemonType(id: 1, name: "test");
      container.read(filterHandlerProvider.notifier).selectType(testType);
      verify(
        listener(
          PokemonFilter(),
          PokemonFilter(type: testType),
        ),
      ).called(1);

      container.read(filterHandlerProvider.notifier).clearType();
      verify(
        listener(
          PokemonFilter(type: testType),
          PokemonFilter(),
        ),
      ).called(1);
    });

    test("changing name filter produces correct result", () {
      container.listen<PokemonFilter>(
        filterHandlerProvider,
        listener.call,
        fireImmediately: true,
      );

      container.read(filterHandlerProvider.notifier).selectName("test");

      verify(
        listener(
          PokemonFilter(),
          PokemonFilter(name: "test"),
        ),
      ).called(1);

      container.read(filterHandlerProvider.notifier).clearName();
      verify(
        listener(
          PokemonFilter(name: "test"),
          PokemonFilter(),
        ),
      ).called(1);
    });
  });
}
