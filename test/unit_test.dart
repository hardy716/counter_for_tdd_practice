import 'package:flutter_test/flutter_test.dart';
import 'package:counter_tdd_practice/features/counter/counter.dart';

void main() {
  group('Counter', () {
    test('value should start at 0', () {
      final counter = Counter();
      expect(counter.value, 0);
    });

    test('value should be incremented', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });

    test('value should not be incremented beyond maxValue', () {
      final counter = Counter();
      for (int i = 0; i < Counter.maxValue + 1; i++) {
        counter.increment();
      }
      expect(counter.value, Counter.maxValue);
    });

    test('value should be decremented', () {
      final counter = Counter();
      counter.increment();
      counter.decrement();
      expect(counter.value, 0);
    });

    test('value should not be decremented below minValue', () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, Counter.minValue);
    });

    test('value should be reset', () {
      final counter = Counter();
      counter.increment();
      counter.reset();
      expect(counter.value, 0);
    });
  });
}
