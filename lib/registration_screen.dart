import 'package:flutter/material.dart';
import 'registration_form_widget.dart';
import 'styles.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF2F4F7),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: RegistrationFormWidget(),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xFFF2F4F7),
          title: Padding(
            padding: EdgeInsets.only(top: 8),
            child: Text(
              'Регистрация',
              style: mainHeader,
            ),
          ),
        ),
      ),
    );
  }
}
