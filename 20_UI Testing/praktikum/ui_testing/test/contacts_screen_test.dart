import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_testing/screens/contacts_screen.dart';

void main() {
  group("Contacts Page Test -", () {
    testWidgets('AppBar Title Test', (WidgetTester tester) async {
      final appBarTitle = find.text("Contacts");

      await tester.pumpWidget(const MaterialApp(home: ContactsScreen()));

      expect(appBarTitle, findsOneWidget);
    });

    testWidgets("Hero Icon Test", (WidgetTester tester) async {
      final contactTitleIcon = find.byIcon(Icons.phone_android);

      await tester.pumpWidget(const MaterialApp(home: ContactsScreen()));

      expect(contactTitleIcon, findsOneWidget);
    });

    testWidgets("Hero Title Test", (WidgetTester tester) async {
      final contactTitle = find.text("Create New Contacts");

      await tester.pumpWidget(const MaterialApp(home: ContactsScreen()));

      expect(contactTitle, findsOneWidget);
    });

    testWidgets("Two Input Fields Test", (WidgetTester tester) async {
      final inputs = find.byType(TextFormField);

      await tester.pumpWidget(const MaterialApp(home: ContactsScreen()));

      expect(inputs, findsNWidgets(2));
    });

    testWidgets("One Submit Elevated Button Test", (WidgetTester tester) async {
      final submitElevatedButton =
          find.widgetWithText(ElevatedButton, "Submit");

      await tester.pumpWidget(const MaterialApp(home: ContactsScreen()));

      expect(submitElevatedButton, findsOneWidget);
    });

    testWidgets("Date Picker Popup Test", (WidgetTester tester) async {
      final datePickerButton =
          find.widgetWithIcon(IconButton, Icons.date_range_rounded);

      await tester.pumpWidget(const MaterialApp(home: ContactsScreen()));

      await tester.tap(datePickerButton);
      await tester.pump();

      final datePickerPopup = find.text("SELECT DATE");

      expect(datePickerPopup, findsOneWidget);
    });

    testWidgets("Color Picker Popup Test", (WidgetTester tester) async {
      final colorPickerButton = find.widgetWithText(TextButton, "Color");

      await tester.pumpWidget(const MaterialApp(home: ContactsScreen()));

      await tester.tap(colorPickerButton);
      await tester.pump();

      final colorPickerPopup = find.text("Pick Your Color");

      expect(colorPickerPopup, findsOneWidget);
    });

    group("Add Contact Submit Validation Test -", () {
      testWidgets("Empty Input Test", (WidgetTester tester) async {
        final submitButton = find.text("Submit");

        await tester.pumpWidget(const MaterialApp(home: ContactsScreen()));
        await tester.ensureVisible(submitButton);
        await tester.pumpAndSettle();
        await tester.tap(submitButton);
        await tester.pump();

        final snackBarPopup = find.byType(SnackBar);

        expect(snackBarPopup, findsOneWidget);
      });

      testWidgets("Invalid Input Test", (WidgetTester tester) async {
        final nameField = find.widgetWithText(TextFormField, "Name");
        final numberField = find.widgetWithText(TextFormField, "Number");
        final submitButton = find.widgetWithText(ElevatedButton, "Submit");

        await tester.pumpWidget(const MaterialApp(home: ContactsScreen()));
        await tester.enterText(nameField, "kang");
        await tester.enterText(numberField, "123");

        await tester.ensureVisible(submitButton);
        await tester.pumpAndSettle();
        await tester.tap(submitButton);
        await tester.pump();

        final nameOutput = find.widgetWithText(Text, "kang");
        final numberOutput = find.widgetWithText(Text, "123");

        expect(nameOutput, findsNothing);
        expect(numberOutput, findsNothing);
      });

      testWidgets("Valid Input Test", (WidgetTester tester) async {
        final nameField = find.widgetWithText(TextFormField, "Name");
        final numberField = find.widgetWithText(TextFormField, "Number");
        final submitButton = find.widgetWithText(ElevatedButton, "Submit");

        await tester.pumpWidget(const MaterialApp(home: ContactsScreen()));
        await tester.enterText(nameField, "Kang Haerin");
        await tester.enterText(numberField, "0011223344");

        await tester.ensureVisible(submitButton);
        await tester.pumpAndSettle();
        await tester.tap(submitButton);
        await tester.pumpAndSettle();

        final nameOutput = find.text("Kang Haerin");
        final numberOutput = find.text("+620011223344");

        await tester.ensureVisible(nameOutput);
        await tester.pumpAndSettle();

        expect(nameOutput, findsOneWidget);
        expect(numberOutput, findsOneWidget);
      });
    });

    group("List Contacts Test - ", () {
      testWidgets("List Contacts Title Test", (WidgetTester tester) async {
        final listContactsTitle = find.text("List Contacts");
        final scrollable = find.byKey(const ValueKey("scrollable"));

        await tester.pumpWidget(const MaterialApp(home: ContactsScreen()));
        await tester.pumpAndSettle();
        await tester.dragUntilVisible(
          listContactsTitle,
          scrollable,
          const Offset(0, -500),
        );
        await tester.pump();

        expect(listContactsTitle, findsOneWidget);
      });

      testWidgets("Delete Contact Test", (WidgetTester tester) async {
        final deleteButton = find.byIcon(Icons.delete_outlined);
        final scrollable = find.byKey(const ValueKey("scrollable"));

        await tester.pumpWidget(const MaterialApp(home: ContactsScreen()));
        await tester.pumpAndSettle();
        await tester.drag(
          scrollable,
          const Offset(0, -500),
        );
        await tester.pump();

        await tester.tap(deleteButton.first);
        await tester.pump();

        final deletedContact = find.text("Name A");

        expect(deletedContact, findsNothing);
      });

      testWidgets("Edit Contact Test", (WidgetTester tester) async {
        final editButton = find.byIcon(Icons.edit_outlined);
        final scrollable = find.byKey(const ValueKey("scrollable"));

        await tester.pumpWidget(const MaterialApp(home: ContactsScreen()));
        await tester.pumpAndSettle();
        await tester.drag(
          scrollable,
          const Offset(0, -500),
        );
        await tester.pump();

        await tester.tap(editButton.first);
        await tester.pump();

        final nameField = find.widgetWithText(TextFormField, "Name");
        final numberField = find.widgetWithText(TextFormField, "Number");
        final submitButton = find.widgetWithText(ElevatedButton, "Submit");

        await tester.enterText(nameField, "New Name");
        await tester.enterText(numberField, "010203040506");

        await tester.ensureVisible(submitButton);
        await tester.pumpAndSettle();
        await tester.tap(submitButton);
        await tester.pumpAndSettle();

        final nameOutput = find.text("New Name");
        final numberOutput = find.text("+62010203040506");

        await tester.drag(
          scrollable,
          const Offset(0, -500),
        );
        await tester.pump();

        expect(nameOutput, findsOneWidget);
        expect(numberOutput, findsOneWidget);
      });
    });
  });
}
