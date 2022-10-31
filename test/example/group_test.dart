
import 'package:flutter_test/flutter_test.dart';

int sum(int a, int b) => a+b;

void main() {
  
  group("Test Sum()", () {
    test("positive", () {
      // This is 1 + 2, is equals 3 or not
      expect(sum(1, 2), equals(3));
    });
    test("negative", () {
      // This is 1 + 2, is equals 3 or not
      expect(sum(1, -10), equals(-9));
    });
  });
  
}