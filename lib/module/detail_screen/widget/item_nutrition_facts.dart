import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/ui/style/app_color.dart';
import '../../../core/ui/style/app_text_style.dart';

class ItemNutritionFact extends StatelessWidget {
  const ItemNutritionFact({
    super.key,
    required this.svgPath,
    required this.value,
    required this.unit,
    required this.label,
  });

  final String svgPath;
  final String value;
  final String unit;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 3.h,
      children: [
        SvgPicture.asset(svgPath),
        Text(value, style: AppTextStyle.font16Medium.copyWith(height: 0)),
        Text(
          unit,
          style: AppTextStyle.font14Regular.copyWith(
            color: AppColor.slateGrey,
            height: 0,
          ),
        ),
        Text(
          label,
          style: AppTextStyle.font12Regular.copyWith(
            height: 0,
            color: AppColor.slateGrey.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
