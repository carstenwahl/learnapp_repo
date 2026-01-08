import 'package:flutter_test/flutter_test.dart';

import 'package:learnapp/app/app.dart';

void main() {
  testWidgets('Start screen buttons are displayed', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Nächster Screen'), findsOneWidget);
    expect(find.text('Test'), findsOneWidget);
  });

  testWidgets('Navigation to selection screen works', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    await tester.tap(find.text('Nächster Screen'));
    await tester.pumpAndSettle();

    expect(find.text('Element1'), findsOneWidget);
    expect(find.text('Element5'), findsOneWidget);
  });

  testWidgets('Selection screen displays all 5 items', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    await tester.tap(find.text('Nächster Screen'));
    await tester.pumpAndSettle();

    for (int i = 1; i <= 5; i++) {
      expect(find.text('Element$i'), findsOneWidget);
      expect(find.text('$i'), findsWidgets);
    }
  });
}
