import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';

class Itemfact extends StatelessWidget {
  const Itemfact({super.key, required this.number, required this.mesure});
  final String number;
  final String mesure;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          number,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.font12Medium.copyWith(
            color: AppColor.charcoalGray,
          ),
        ),
        SizedBox(width: 2.w),
        Text(
          mesure,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyle.font12Regular.copyWith(
            color: AppColor.charcoalGray,
          ),
        ),
      ],
    );
  }
}
