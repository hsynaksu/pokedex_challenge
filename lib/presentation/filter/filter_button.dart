import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_challenge/presentation/filter/filter_modal.dart';
import 'package:pokedex_challenge/providers/type_filter_notifier.dart';

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
    ref.read(typeFilterProvider.notifier).clearType();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedType = ref.watch(typeFilterProvider);
    final isSelected = selectedType != null;
    final selectedColor = Theme.of(context).colorScheme.surfaceContainerHigh;

    return ActionChip(
      padding: const EdgeInsets.all(4),
      label: Text(isSelected ? selectedType.name : "Type"),
      labelStyle: Theme.of(context).textTheme.labelLarge,
      backgroundColor: isSelected ? selectedColor : null,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: () {
        isSelected ? removeSelectedFilter(ref) : openModal(context);
      },
    );
  }
}
