import 'package:flutter_test/flutter_test.dart';

void main() {

  var data = "Very";

  setUpAll(() {
    print("Start Unit Test");
  });

  // setUp is to initiate the variable value before use the function test
  setUp(() {
    data = "Very";
  });

  group("Group Test", () {

    test("Testing 1", () {
      data = "name is $data";
    });

    test("Testing 2", () {
      expect(data, "Very");
    });


  });

}
