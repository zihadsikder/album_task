import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:task/app/core/config/binding.dart';
import 'package:task/app/core/constants/theme_data.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      initialBinding: IntBinding(),
      theme: AppThemeData.lightThemeData,
      themeMode: ThemeMode.system,
      getPages: AppPages.routes,
    ),
  );
}
