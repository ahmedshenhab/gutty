import 'package:flutter/material.dart';
import '../style/app_color.dart';

class AppLightTheme {
  static ThemeData lighTheme = ThemeData(
    progressIndicatorTheme:  const ProgressIndicatorThemeData(
      color: AppColor.primary
    ),
    scaffoldBackgroundColor: AppColor.white,
    fontFamily: "Ubuntu",
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      titleSpacing: 0,
      backgroundColor: AppColor.white,
      elevation: 0,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: AppColor.primary),

    textTheme: ThemeData.light().textTheme.apply(bodyColor: AppColor.black),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        focusColor: AppColor.transparent,
        hoverColor: AppColor.transparent,
        highlightColor: AppColor.transparent,
      ),
    ),
  );
}
