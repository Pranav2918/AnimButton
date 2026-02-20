import 'package:animbutton/animbutton.dart';
import 'package:flutter/material.dart';

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimButton Showcase'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Basic Button
            AnimButton(
              label: 'Basic Button',
              onPressed: () => debugPrint("Basic Button Tapped"),
            ),
            const SizedBox(height: 20),

            // Gradient Button with Shadow
            AnimButton(
              width: 200,
              height: 55,
              borderRadius: 12,
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.purple],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withValues(alpha: 0.4),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
              label: 'Gradient Button',
              onPressed: () => debugPrint("Gradient Button Tapped"),
            ),
            const SizedBox(height: 20),

            // Button with Custom Child (Icon + Text)
            AnimButton(
              width: 180,
              height: 50,
              buttonColor: Colors.orangeAccent,
              onPressed: () => debugPrint("Custom Child Button Tapped"),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.star, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Scale Customization
            AnimButton(
              label: 'Slow',
              duration: const Duration(milliseconds: 300),
              animationEnd: 0.95,
              buttonColor: Colors.teal,
              onPressed: () => debugPrint("Slow Button Tapped"),
            ),
          ],
        ),
      ),
    );
  }
}
