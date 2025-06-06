import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,

    required this.onPressed,
    this.fixedHeight,
    this.fixedwidth,
    this.raduis = 8,
    required this.child, this.padding,
  });

  final double? fixedHeight;
  final double? fixedwidth;
  final double raduis;
  final Widget child;
  final void Function()? onPressed;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fixedHeight,
      width: fixedwidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: padding,
          elevation: 0,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(raduis.r),
          ),

          backgroundColor: AppColor.primary,
        ),
        child: child,
      ),
    );
  }
}
