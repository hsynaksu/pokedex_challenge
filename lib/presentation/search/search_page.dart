import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pokedex_challenge/presentation/search/providers/fetch_pokemon_names.dart';
import 'package:pokedex_challenge/presentation/search/providers/search_name_debouncer.dart';
import 'package:pokedex_challenge/providers/filter_handler.dart';
import 'package:pokedex_challenge/utils/extensions.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Set initial value of textfield with existing filter
    final existingFilter = ref.read(filterHandlerProvider).name ?? "";
    controller.text = existingFilter;

    if (existingFilter.isNotEmpty) {
      ref.read(searchNameDebouncerProvider.notifier).setDebounced(existingFilter);
    }
  }

  void handleBackButton() {
    Navigator.of(context).pop();
  }

  void handleCloseButton() {
    ref.read(filterHandlerProvider.notifier).clearName();
    Navigator.of(context).pop();
  }

  void handleSubmit(String name) {
    ref.read(filterHandlerProvider.notifier).selectName(name);
    Navigator.of(context).pop();
  }

  void handleChange(String value) {
    ref.read(searchNameDebouncerProvider.notifier).setDebounced(value);
  }

  @override
  Widget build(BuildContext context) {
    final recommendedNames = ref.watch(fetchPokemonNamesProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 24),
                prefixIcon: IconButton(
                  onPressed: handleBackButton,
                  icon: const Icon(Icons.arrow_back),
                ),
                suffixIcon: IconButton(
                  onPressed: handleCloseButton,
                  icon: const Icon(Icons.close),
                ),
              ),
              textInputAction: TextInputAction.search,
              onSubmitted: handleSubmit,
              onChanged: handleChange,
            ),
            recommendedNames.when(
              data: (names) => Expanded(
                child: ListView.builder(
                  itemCount: names.length,
                  itemBuilder: (context, index) => ListTile(
                    minTileHeight: 72,
                    title: Text(names[index].capitalize()),
                  ),
                ),
              ),
              loading: () => const LinearProgressIndicator(),
              error: (error, stackTrace) => Text(error.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
