import 'package:flutter/material.dart';
import 'reg_form.dart';

class RegScreen extends StatelessWidget {
  const RegScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF2F4F7),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: RegForm(),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFFF2F4F7),
          title: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              'Регистрация',
              style: TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
