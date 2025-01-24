import 'package:animbutton/animbutton.dart';
import 'package:example/src/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Example Widget Tests', () {
    testWidgets('renders AnimButton with correct properties', (WidgetTester tester) async {
      // Build the Example widget
      await tester.pumpWidget(const MaterialApp(home: Example()));

      // Verify that AnimButton is present
      final animButtonFinder = find.text('Anim Button');
      expect(animButtonFinder, findsOneWidget);

      // Verify button's text style
      final textWidget = tester.widget<Text>(animButtonFinder);
      expect(textWidget.style?.color, Colors.white);
      expect(textWidget.style?.fontSize, 20.0);
      expect(textWidget.style?.fontWeight, FontWeight.normal);

      // Verify button dimensions
      final button = tester.widget<AnimButton>(find.byType(AnimButton));
      expect(button.height, 45.0);
      expect(button.buttonColor, Colors.black);
      expect(button.borderRadius, 10.0);
    });

    testWidgets('AnimButton triggers onPressed callback', (WidgetTester tester) async {
      // Create a flag to check callback
      bool buttonTapped = false;

      // Build the Example widget with modified onPressed
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Center(
              child: AnimButton(
                buttonColor: Colors.black,
                height: 45.0,
                width: 200.0, // Use a fixed width for testing
                animationCurve: Curves.easeIn,
                borderRadius: 10.0,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                ),
                label: 'Anim Button',
                onPressed: () {
                  buttonTapped = true;
                },
              ),
            ),
          ),
        ),
      );

      // Tap the button
      await tester.tap(find.text('Anim Button'));
      await tester.pumpAndSettle();

      // Verify onPressed was triggered
      expect(buttonTapped, isTrue);
    });

    testWidgets('AnimButton adapts to MediaQuery width', (WidgetTester tester) async {
      // Build the Example widget
      await tester.pumpWidget(const MaterialApp(home: Example()));

      // Verify button width is 40% of screen width
      final animButton = tester.widget<AnimButton>(find.byType(AnimButton));
      final screenWidth = tester.getSize(find.byType(Scaffold)).width;
      expect(animButton.width, closeTo(screenWidth * 0.40, 0.1));
    });
  });
}
