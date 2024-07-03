import 'package:flutter/material.dart';

class HeaderText extends StatelessWidget {
  HeaderText({super.key, required this.data});
  String data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: Text(data,
          style: TextStyle(
            color: Color(0xFF101828),
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: 'Inter',
          )),
    );
  }
}
