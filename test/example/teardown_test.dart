import 'package:flutter_test/flutter_test.dart';

void main() {

  var data = "Very";

  // This is just like SetUp but SetUp is always first running of the test
  // so TearDown is the function which are always running in the last test
  tearDown(() {
    data = "Very";
    print('This is TearDown');
  });

  group("Group Test", () {

    test("Testing 1", () {
      data = "name is $data";
      print(data);
    });

    test("Testing 2", () {
      expect(data, "Very");
    });

  });

}
