import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_challenge/presentation/filter/chip_list.dart';
import 'package:pokedex_challenge/presentation/filter/providers/fetch_pokemon_types.dart';
import 'package:pokedex_challenge/providers/filter_handler.dart';

class FilterModal extends ConsumerWidget {
  const FilterModal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allTypesResponse = ref.watch(fetchPokemonTypesProvider);

    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Type',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          allTypesResponse.when(
            data: (data) {
              return ChipList(
                types: data,
                onPressed: (selectedType) {
                  ref.read(filterHandlerProvider.notifier).selectType(selectedType);
                  Navigator.of(context).pop();
                },
              );
            },
            error: (error, stackTrace) => Text(error.toString()),
            loading: () => const LinearProgressIndicator(),
          ),
        ],
      ),
    );
  }
}
