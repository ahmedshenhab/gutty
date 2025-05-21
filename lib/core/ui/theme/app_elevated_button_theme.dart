import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/App_font_weight.dart';
import 'package:gutty/core/ui/style/app_color.dart';

class AppElevatedButtonTheme {
  static final elevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColor.primary,

      textStyle: TextStyle(
        fontFamily: 'cambria',
        fontSize: 16.sp,
        height: 1.3,
        fontWeight: AppFontWeight.medium,
        color: AppColor.white,
      ),
    ),
  );
}
