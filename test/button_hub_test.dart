import 'package:flutter/material.dart';
import 'package:button_hub/button_hub.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: Center(
          child: Button73(
            text: "Click Me!",
            onTap: () {
              print("Button Pressed!");
            },
          ),
        ),
      ),
    );
  }
}
