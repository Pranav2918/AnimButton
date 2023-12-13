import 'package:animbutton/animbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('AnimButton Widget Test', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: AnimButton(
            label: 'Test Button',
            onPressed: () {
              debugPrint('Button Pressed!');
            },
          ),
        ),
      ),
    );

    expect(find.text('Test Button'), findsOneWidget);

    await tester.tap(find.text('Test Button'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 600));
  });
}
