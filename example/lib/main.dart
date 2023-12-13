import 'package:animbutton/animbutton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Example(),
    );
  }
}

class Example extends StatelessWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimButton(
            buttonColor: Colors.black,
            height: 45.0,
            width: MediaQuery.of(context).size.width * 0.40,
            animationCurve: Curves.easeIn,
            borderRadius: 10.0,
            textStyle: const TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.normal),
            label: 'Anim Button',
            onPressed: () {
              debugPrint("Button Tapped");
            }),
      ),
    );
  }
}
