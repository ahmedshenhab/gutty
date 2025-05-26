import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.fixedHeight = 48,
    this.fixedwidth = 308,
    this.raduis = 8,
  });

  final String text;
  final double fixedHeight;
  final double fixedwidth;
  final double raduis;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        textStyle: AppTextStyle.font16Medium,
        elevation: 0,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(raduis.r),
        ),

        backgroundColor: AppColor.primary,
        fixedSize: Size(fixedwidth.w, fixedHeight.h),
      ),
      child: Text(text),
    );
  }
}
