import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    
    required this.onPressed,
    this.fixedHeight = 48,
    this.fixedwidth = double.infinity,
    this.raduis = 8, required this.child,
  });


  final double fixedHeight;
  final double fixedwidth;
  final double raduis;
  final Widget child;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: fixedHeight,
      width: fixedwidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(raduis.r),
          ),

          backgroundColor: AppColor.primary,
        ),
        child:child,
      ),
    );
  }
}
