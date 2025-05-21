import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';

class AppTextTheme {
  static TextTheme textTheme() {
    return TextTheme(
    bodyMedium: TextStyle(
      fontFamily: 'cambria',
      fontSize: 22.sp,
      height: 1.3,
      fontWeight: FontWeight.bold,
      color: AppColor.black,
    ),
  );
  }
  
}