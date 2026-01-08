import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:learnapp/app/app.dart';

void main() {
  testWidgets('Welcome screen is displayed on app start', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Willkommen in der super LernApp'), findsOneWidget);
    
    // Pump through the 2-second delay with extended timeout
    await tester.pumpAndSettle(const Duration(milliseconds: 2500));
  });

  testWidgets('Welcome screen navigates to login screen after delay', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    expect(find.text('Willkommen in der super LernApp'), findsOneWidget);

    await tester.pumpAndSettle(const Duration(seconds: 3));

    expect(find.text('Anmelden'), findsWidgets); // Multiple occurrences (title + button)
    expect(find.byIcon(Icons.email), findsOneWidget);
    expect(find.byIcon(Icons.lock), findsOneWidget);
  });

  testWidgets('Login screen displays all elements', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    await tester.pumpAndSettle(const Duration(seconds: 3));

    expect(find.text('Anmelden'), findsWidgets); // Title and button
    expect(find.byIcon(Icons.email), findsOneWidget);
    expect(find.byIcon(Icons.lock), findsOneWidget);
    expect(find.text('Passwort vergessen?'), findsOneWidget);
    expect(find.text('Konto erstellen'), findsOneWidget);
  });

  testWidgets('Login button validation works', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Try to login without filling fields
    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pumpAndSettle();

    expect(find.text('Bitte geben Sie Ihre E-Mail ein'), findsOneWidget);
  });

  testWidgets('Password toggle works', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    await tester.pumpAndSettle(const Duration(seconds: 3));

    final visibilityIcon = find.byIcon(Icons.visibility_off);
    expect(visibilityIcon, findsOneWidget);

    await tester.tap(visibilityIcon);
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.visibility), findsOneWidget);
  });

  testWidgets('Forgot password shows snackbar', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    await tester.pumpAndSettle(const Duration(seconds: 3));

    await tester.tap(find.text('Passwort vergessen?'));
    await tester.pumpAndSettle();

    expect(find.text('Passwort zurücksetzen'), findsWidgets);
    expect(find.text('E-Mail'), findsOneWidget);
  });

  testWidgets('Create account navigates to registration screen', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    await tester.pumpAndSettle(const Duration(seconds: 3));

    await tester.tap(find.byType(OutlinedButton));
    await tester.pumpAndSettle();

    expect(find.text('Neues Konto'), findsOneWidget);
    expect(find.text('Zurück zur Anmeldung'), findsOneWidget);
  });

  testWidgets('Registration screen displays all fields', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    await tester.pumpAndSettle(const Duration(seconds: 3));

    await tester.tap(find.byType(OutlinedButton));
    await tester.pumpAndSettle();

    expect(find.text('Neues Konto'), findsOneWidget);
    expect(find.text('E-Mail'), findsOneWidget);
    expect(find.text('Passwort'), findsWidgets); // Multiple occurrences
    expect(find.text('Passwort bestätigen'), findsOneWidget);
    expect(find.byIcon(Icons.email), findsOneWidget);
    expect(find.byIcon(Icons.lock), findsWidgets); // Two lock icons for both password fields
  });

  testWidgets('Login button shows loading spinner when clicked', (WidgetTester tester) async {
    await tester.pumpWidget(const App());

    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Fill in login fields with valid format
    final loginEmailField = find.byType(TextFormField).first;
    final loginPasswordField = find.byType(TextFormField).at(1);

    await tester.enterText(loginEmailField, 'test@example.com');
    await tester.enterText(loginPasswordField, 'password123');

    // Tap login button
    await tester.tap(find.byType(ElevatedButton).first);
    await tester.pump(); // Pump once to see the loading spinner

    // Should show loading spinner
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
