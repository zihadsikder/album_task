import 'package:flutter/material.dart';
import 'package:task/app/core/config/app_colors.dart';
import 'package:task/app/core/constants/app_text_style.dart';

class AppThemeData {
  static ThemeData lightThemeData = ThemeData(

    primaryColor: Colors.green,

    primarySwatch: Colors.green,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.bgColor,
      titleTextStyle: AppTextStyle.headLineStyle(),
    ),

    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.bgColor,
      filled: true,
      border: InputBorder.none,

      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(32),
      ),

      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 2, color: AppColors.iconColor),
        borderRadius: BorderRadius.circular(32),
      ),
      hintStyle: TextStyle(
        color: AppColors.hintTextColor,
      ),
    ),

    listTileTheme: ListTileThemeData(
      shape: RoundedRectangleBorder(
        side: BorderSide.none,
        borderRadius: BorderRadius.circular(8.0),
      ),
      tileColor: AppColors.bgColor,
    ),

    cardTheme: CardTheme(
      //color: Colors.green.shade50,
      color: AppColors.bgColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
}
