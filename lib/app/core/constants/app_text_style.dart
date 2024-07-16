import 'package:flutter/material.dart';

class AppTextStyle {
  static TextStyle subHeadLineStyle(
      {Color color = Colors.grey, double fontSize = 14}) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      //letterSpacing: 1.7,
      height: 1.5,
    );
  }

  static TextStyle headLineStyle({Color color = Colors.black}) {
    return TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: color,
        height: 1.5,
    );
  }

  static TextStyle normalStyle(
      {Color color = Colors.black, double fontSize = 16}) {
    return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: color,
      height: 1.5,
    );
  }
}
