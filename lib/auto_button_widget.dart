import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AutoButtonWidget extends StatelessWidget {
  final Color backgroundColor;
  final Color fontColor;
  final String data;
  final double height;
  final VoidCallback onFunc;

  const AutoButtonWidget({
    super.key,
    required this.backgroundColor,
    required this.fontColor,
    required this.data,
    this.height = 48.0,
    required this.onFunc,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFunc,
      child: Container(
        width: double.infinity,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(data,
              style: TextStyle(
                  color: fontColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter')),
        ),
      ),
    );
  }
}
