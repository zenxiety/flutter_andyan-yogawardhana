import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_testing/screens/new_screen.dart';

void main() {
  group("New Page Test -", () {
    testWidgets("AppBar Title Test", (WidgetTester tester) async {
      final appBarTitle = find.text("New Page Title");
      await tester.pumpWidget(const MaterialApp(home: NewScreen()));

      expect(appBarTitle, findsOneWidget);
    });

    testWidgets("Screen Title Test", (WidgetTester tester) async {
      final pageTitle = find.text("The Four Cards");
      await tester.pumpWidget(const MaterialApp(home: NewScreen()));

      expect(pageTitle, findsOneWidget);
    });

    testWidgets("Card Component Test", (WidgetTester tester) async {
      final card = find.byType(Card);
      await tester.pumpWidget(const MaterialApp(home: NewScreen()));

      expect(card, findsNWidgets(4));
    });

    testWidgets("Card Index Test", (WidgetTester tester) async {
      final fifthCard = find.text("Card 5");
      await tester.pumpWidget(const MaterialApp(home: NewScreen()));

      expect(fifthCard, findsNothing);
    });

    testWidgets("Card Icons Test", (WidgetTester tester) async {
      final cardIconWifi = find.byIcon(Icons.wifi);
      final cardIconBattery = find.byIcon(Icons.battery_charging_full);
      final cardIconAndroid = find.byIcon(Icons.android);
      final cardIcon4G = find.byIcon(Icons.four_g_mobiledata);

      await tester.pumpWidget(const MaterialApp(home: NewScreen()));

      expect(cardIconWifi, findsOneWidget);
      expect(cardIconBattery, findsOneWidget);
      expect(cardIconAndroid, findsOneWidget);
      expect(cardIcon4G, findsOneWidget);
    });

    testWidgets("Button Test", (WidgetTester tester) async {
      final learnMoreButton = find.widgetWithText(OutlinedButton, "Learn More");

      await tester.pumpWidget(const MaterialApp(home: NewScreen()));

      expect(learnMoreButton, findsOneWidget);
    });
  });
}
