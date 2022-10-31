import 'package:test/test.dart';

String testingString(String message) {
  return '$message';
}

void main() {
  test("Testing String Expect", () {
    var response = testingString("Dart");
    expect(response, "Dart");
  }, tags: "first");
}
