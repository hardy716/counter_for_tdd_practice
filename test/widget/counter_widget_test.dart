import 'package:counter_tdd_practice/features/counter/domain/entities/counter_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:counter_tdd_practice/features/counter/domain/usecases/counter_usecases.dart';
import 'package:counter_tdd_practice/features/counter/presentation/counter_screen.dart';

void main() {
  late CounterUseCases counterUseCases;

  setUp(() {
    counterUseCases = CounterUseCases();
  });

  Future<void> buildCounterScreen(WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: CounterScreen(counterUseCases: counterUseCases),
    ));
  }

  testWidgets('Counter starts at 0', (WidgetTester tester) async {
    await buildCounterScreen(tester);

    expect(find.text('0'), findsOneWidget);
  });

  group('Tapping increment button', () {
    testWidgets('Counter should be incremented', (WidgetTester tester) async {
      await buildCounterScreen(tester);

      await tester.tap(find.byTooltip('Increment'));
      await tester.pump();

      expect(find.text('1'), findsOneWidget);
    });

    testWidgets('Counter should not be incremented beyond maxValue',
        (WidgetTester tester) async {
      await buildCounterScreen(tester);

      for (int i = 0; i < CounterEntity.maxValue + 1; i++) {
        await tester.tap(find.byTooltip('Increment'));
      }
      await tester.pump();

      expect(find.text('10'), findsOneWidget);
    });
  });

  group('Tapping decrement button', () {
    testWidgets('Counter should be decremented', (WidgetTester tester) async {
      await buildCounterScreen(tester);

      await tester.tap(find.byTooltip('Increment'));
      await tester.tap(find.byTooltip('Decrement'));
      await tester.pump();

      expect(find.text('0'), findsOneWidget);
    });

    testWidgets('Counter should not be decremented below minValue',
        (WidgetTester tester) async {
      await buildCounterScreen(tester);

      await tester.tap(find.byTooltip('Decrement'));
      await tester.pump();

      expect(find.text('0'), findsOneWidget);
    });
  });

  group('Tapping reset button', () {
    testWidgets('Counter should be reset', (WidgetTester tester) async {
      await buildCounterScreen(tester);

      await tester.tap(find.byTooltip('Increment'));
      await tester.tap(find.byTooltip('Reset'));
      await tester.pump();

      expect(find.text('0'), findsOneWidget);
    });
  });
}
