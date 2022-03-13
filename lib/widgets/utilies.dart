import 'package:flutter/material.dart';
class UtiliesText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextDecoration underLine;
  const UtiliesText({required this.text,required this.fontWeight,required this.fontSize,
    required this.color,required this.underLine,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style:
          TextStyle(color: color,
            fontSize: fontSize,
            fontWeight: fontWeight,
        decoration: underLine),
      );
  }
}
