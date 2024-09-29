import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:dixi_prectical/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('CRUD Operations Integration Test', () {
    testWidgets('Create, Update, and Delete an Entry', (WidgetTester tester) async {
      // Launch the application
      app.main();
      await tester.pumpAndSettle();

      // 1. Create an entry
      await tester.tap(find.byIcon(Icons.add)); // Tap the add button
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('entryName')), 'Test Entry');
      await tester.enterText(find.byKey(Key('entryDescription')), 'This is a test entry.');
      await tester.tap(find.byKey(Key('saveButton'))); // Tap save button
      await tester.pumpAndSettle();

      // Verify the entry is added
      expect(find.text('Test Entry'), findsOneWidget);

      // 2. Update the entry
      await tester.tap(find.byIcon(Icons.edit).first); // Tap the edit button of the first entry
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('entryDescription')), 'Updated test entry.');
      await tester.tap(find.byKey(Key('saveButton'))); // Tap save button
      await tester.pumpAndSettle();

      // Verify the entry is updated
      expect(find.text('Updated test entry.'), findsOneWidget);

      // 3. Delete the entry
      await tester.tap(find.byIcon(Icons.delete).first); // Tap the delete button of the first entry
      await tester.pumpAndSettle();
      await tester.tap(find.text('Confirm')); // Confirm deletion
      await tester.pumpAndSettle();

      // Verify the entry is deleted
      expect(find.text('Test Entry'), findsNothing);
    });
  });
}
