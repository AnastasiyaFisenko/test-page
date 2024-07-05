import 'package:flutter/material.dart';

class AutoButton extends StatelessWidget {
  AutoButton(
      {super.key,
      required this.backgroundColor,
      required this.fontColor,
      required this.data,
      this.height = 48});
  int backgroundColor;
  int fontColor;
  double height;
  String data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        debugPrint('Testing');
      },
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: Color(backgroundColor),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: SizedBox(
            height: 24,
            child: Text(data,
                style: TextStyle(
                    color: Color(fontColor),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Inter')),
          ),
        ),
      ),
    );
  }
}
