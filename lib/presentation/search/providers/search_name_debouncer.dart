import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_name_debouncer.g.dart';

@riverpod
class SearchNameDebouncer extends _$SearchNameDebouncer {
  Timer? _debounceTimer;

  @override
  String build() {
    ref.onDispose(() {
      _debounceTimer?.cancel();
    });

    return "";
  }

  void setDebounced(String name) {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 300), () {
      state = name;
    });
  }
}
