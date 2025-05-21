import 'package:flutter/material.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/theme/app_elevated_button_theme.dart';
import 'package:gutty/core/ui/theme/app_text_theme.dart';

class AppLightTheme {
  static ThemeData lighTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.white,
    fontFamily: "Ubuntu",
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColor.white,
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),

    textTheme: AppTextTheme.textTheme(),
    elevatedButtonTheme: AppElevatedButtonTheme.elevatedButtonTheme,
  );
}
