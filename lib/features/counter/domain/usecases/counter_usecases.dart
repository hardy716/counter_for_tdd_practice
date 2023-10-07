import 'package:counter_tdd_practice/features/counter/domain/entities/counter_entity.dart';

class CounterUseCases {
  void increment(CounterEntity counterEntity) {
    if (counterEntity.value < 10) {
      counterEntity.value += 1;
    }
  }

  void decrement(CounterEntity counterEntity) {
    if (counterEntity.value > 0) {
      counterEntity.value -= 1;
    }
  }

  void reset(CounterEntity counterEntity) {
    counterEntity.value = 0;
  }
}
