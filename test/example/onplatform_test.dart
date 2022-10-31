@OnPlatform({
  "mac-os" : Skip("Not Support for Mac Os")
})

import 'package:test/test.dart';

String testingString(String message) {
  return '$message';
}

void main() {
  test("Testing String Expect", () {

    var response = testingString("Dart");
    expect(response, "Dart");

  });
}