import 'package:flutter/material.dart';
import 'auto_button.dart';
import 'header_text.dart';

class App extends StatelessWidget {
  const App({super.key});
  final imagePath = "assets/gradient_option.png";

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 132, left: 16, right: 16),
                child: Image.asset(imagePath, width: 240, height: 240),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: 128, left: 16, right: 16, bottom: 40),
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      HeaderText(data: 'Создавайте и участвуйте'),
                      HeaderText(data: 'в спортивных событиях'),
                      HeaderText(data: 'легко и удобно!'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 24, left: 16, right: 16),
                child: SizedBox(
                  width: 328,
                  height: 112,
                  child: Column(
                    children: [
                      AutoButton(
                          backgroundColor: 0xFFEC4A0A,
                          fontColor: 0xFFFFFFFF,
                          data: 'Зарегистрироваться'),
                      SizedBox(height: 16),
                      AutoButton(
                          backgroundColor: 0XFFF2F4F7,
                          fontColor: 0xFFEC4A0A,
                          data: 'Войти'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
