// lib/counter.dart
class Counter {
  static const int maxValue = 10;
  static const int minValue = 0;
  int value = 0;

  void increment() {
    if (value >= maxValue) return;
    value++;
  }

  void decrement() {
    if (value <= minValue) return;
    value--;
  }

  void reset() {
    value = 0;
  }
}
