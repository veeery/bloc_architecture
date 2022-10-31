import 'package:test/test.dart';

String testingString(var message) {
  return message;
}

int sum(int a, int b) {
  return a + b;
}

void main() {
  // This Unit Testing with String + Matcher
  test("Testing String Mathcer", () {
    // This Find String with End Matcher
    expect(testingString("Name is Very"), endsWith("Very"));
    // This Find String with Start Matcher
    expect(testingString("Name is Very"), startsWith("Name"));
    // This Find String with ignore case Matcher
    expect(testingString("Name is Very"), equalsIgnoringCase("Name is Very"));
    // This Find is Type Data is String or Not
    expect(testingString("Very"), isA<String>());
  });

  // This Unit Testing with Integer + Matcher
  test("Test sum() with matcher", () {
    // Is 1+1 = 2
    expect(sum(1, 1), equals(2));
    // Is 2 greaterThan 1
    expect(sum(1, 1), greaterThan(1));
    // Is 2 lessThan 10
    expect(sum(1, 1), lessThan(10));


    // if all is true that passed the test
  });
}
