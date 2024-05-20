import 'package:flutter_test/flutter_test.dart';
import 'package:pokedex_challenge/utils/extensions.dart';

void main() {
  test("method should capitalize first letter of string", () {
    const test = "test";

    expect(test.capitalize(), "Test");
  });
}
