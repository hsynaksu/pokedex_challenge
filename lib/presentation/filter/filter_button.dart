import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_challenge/presentation/filter/filter_modal.dart';
import 'package:pokedex_challenge/providers/filter_handler.dart';

class FilterButton extends ConsumerWidget {
  const FilterButton({super.key});

  void openModal(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (context) => const FilterModal(),
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerLow,
    );
  }

  void removeSelectedFilter(WidgetRef ref) {
    ref.read(filterHandlerProvider.notifier).clearType();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(filterHandlerProvider);
    final isSelected = filter.type != null;
    final selectedColor = Theme.of(context).colorScheme.surfaceContainerHigh;

    return ActionChip(
      padding: const EdgeInsets.all(4),
      label: Text(isSelected ? filter.type!.name : "Type"),
      labelStyle: Theme.of(context).textTheme.labelLarge,
      backgroundColor: isSelected ? selectedColor : null,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () {
        isSelected ? removeSelectedFilter(ref) : openModal(context);
      },
    );
  }
}
