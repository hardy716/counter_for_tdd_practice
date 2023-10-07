import 'package:flutter_test/flutter_test.dart';
import 'package:counter_tdd_practice/features/counter/domain/entities/counter_entity.dart';

void main() {
  group('CounterEntity', () {
    late CounterEntity counterEntity;

    setUp(() {
      counterEntity = CounterEntity(0);
    });

    test('value should start at 0', () {
      expect(counterEntity.value, 0);
    });
  });
}
