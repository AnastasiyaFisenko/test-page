import 'package:flutter/material.dart';

class HeadersText extends StatelessWidget {
  HeadersText({super.key, required this.data});
  String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Align(
            alignment: AlignmentDirectional.topStart,
            child: Text(
              data,
              style: TextStyle(
                color: Color(0xFF667085),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
