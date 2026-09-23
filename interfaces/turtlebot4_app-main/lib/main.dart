import 'package:flutter/material.dart';
import 'screens/control_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TurtleBot4 Control & Video',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const TurtleBotControlPage(),
    );
  }
}
