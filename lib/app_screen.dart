import 'package:flutter/material.dart';
import 'auto_button.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});
  final imagePath = "assets/gradient_option.png";

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double imageSize = screenHeight <= 640 ? 160.0 : 240.0;

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF2F4F7),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 132,
                width: double.infinity,
              ),
              Image.asset(imagePath, width: imageSize, height: imageSize),
              Spacer(),
              Text(
                  'Создавайте и участвуйте\nв спортивных событиях\nлегко и удобно!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF101828),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                  )),
              SizedBox(
                height: 40,
              ),
              AutoButton(
                backgroundColor: Color(0xFFEC4A0A),
                fontColor: Color(0xFFFFFFFF),
                data: 'Зарегистрироваться',
                onFunc: () {},
              ),
              SizedBox(height: 16),
              AutoButton(
                  backgroundColor: Color(0XFFF2F4F7),
                  fontColor: Color(0xFFEC4A0A),
                  data: 'Войти',
                  onFunc: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
