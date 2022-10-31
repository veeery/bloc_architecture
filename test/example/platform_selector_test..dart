//  This mean only run on Windows or Android
// so the entire test in here only run windows or Android
@TestOn("windows || android")

import 'package:test/test.dart';

String testingString(String message) {
  return message;
}

void main() {
  test("Testing String Expect", () {

    var response = testingString("Dart");
    expect(response, "Dart");

  }
  // ,testOn: "windows"
  );
}