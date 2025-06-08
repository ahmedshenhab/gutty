import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';

class MealPlanCard extends StatelessWidget {
  const MealPlanCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle, this.color,
  });

  final String imagePath;
  final String title;
  final String subtitle;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsetsDirectional.zero,
      color: color?? AppColor.white,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      elevation: 0.1,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
        color: color?? AppColor.white,
          
          borderRadius: BorderRadius.circular(8.r)),
        width: double.infinity,
        height: 232.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(imagePath, fit: BoxFit.fill, height: 120.h,),
            SizedBox(height: 19.h),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyle.font16Bold),
                  SizedBox(height: 7.h),
                  Text(
                    subtitle,
                    style: AppTextStyle.font14Regular.copyWith(
                      color: AppColor.charcoalGray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
