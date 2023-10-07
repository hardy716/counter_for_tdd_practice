import 'package:counter_tdd_practice/features/counter/domain/entities/counter_entity.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:counter_tdd_practice/features/counter/domain/usecases/counter_usecases.dart';

void main() {
  group('CounterUseCases', () {
    late CounterEntity counterEntity;
    late CounterUseCases counterUseCases;

    setUp(() {
      counterEntity = CounterEntity(0);
      counterUseCases = CounterUseCases();
    });

    test('value should be incremented', () {
      counterUseCases.increment(counterEntity);
      expect(counterEntity.value, 1);
    });

    test('value should not be incremented beyond maxValue', () {
      for (int i = 0; i < CounterEntity.maxValue + 1; i++) {
        counterUseCases.increment(counterEntity);
      }
      expect(counterEntity.value, CounterEntity.maxValue);
    });

    test('value should be decremented', () {
      counterUseCases.increment(counterEntity);
      counterUseCases.decrement(counterEntity);
      expect(counterEntity.value, 0);
    });

    test('value should not be decremented below minValue', () {
      counterUseCases.decrement(counterEntity);
      expect(counterEntity.value, CounterEntity.minValue);
    });

    test('value should be reset', () {
      counterUseCases.increment(counterEntity);
      counterUseCases.reset(counterEntity);
      expect(counterEntity.value, 0);
    });
  });
}
