import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:counter_tdd_practice/main.dart';
import 'package:counter_tdd_practice/features/counter/domain/entities/counter_entity.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Counter App Integration Test', () {
    testWidgets('increments and decrements counter',
        (WidgetTester tester) async {
      await tester.pumpWidget(const CounterApp());

      // Counter Starts at 0
      expect(find.text('0'), findsOneWidget);

      // Counter should increment
      await tester.tap(find.byTooltip('Increment'));
      await tester.pumpAndSettle();
      expect(find.text('1'), findsOneWidget);

      // Counter should decrement
      await tester.tap(find.byTooltip('Decrement'));
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);

      // Counter should not be decremented below minValue
      await tester.tap(find.byTooltip('Decrement'));
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);

      // Counter should not be incremented beyond maxValue
      for (int i = 0; i < CounterEntity.maxValue + 1; i++) {
        await tester.tap(find.byTooltip('Increment'));
      }
      await tester.pumpAndSettle();
      expect(find.text('10'), findsOneWidget);

      // Counter reset
      await tester.tap(find.byTooltip('Reset'));
      await tester.pumpAndSettle();
      expect(find.text('0'), findsOneWidget);
    });
  });
}
