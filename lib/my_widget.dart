import 'package:flutter/material.dart';
import 'app.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF2F4F7),
        body: App(),
      ),
    );
  }
}
