import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/reusable/custom_elevated_button.dart';
import '../../../../../core/ui/style/app_color.dart';
import '../../../../../core/ui/style/app_text_style.dart';

class HeaderHome extends StatelessWidget {
  const HeaderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return   Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/svg/meal_fram.svg',
              height: 200.h,
              fit: BoxFit.cover,
            ),
    
            Container(
              height: 200.h,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColor.black.withValues(alpha: 0.2),
                    blurRadius: 4.r,
                    offset: const Offset(0, 4),
                  ),
                ],
                color: AppColor.black.withValues(alpha: 0.3),
              ),
            ),
    
            Column(
              children: [
                Text(
                  'Fresh & Healthy Meals\nDelivered To You',
                  style: AppTextStyle.font24Bold.copyWith(
                    color: AppColor.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 8.h),
    
                CustomElevatedButton(
                  fixedHeight: 40.h,
                  fixedwidth: 187.w,
                  padding: EdgeInsets.symmetric(
                    horizontal: 23.w,
                    vertical: 8.h,
                  ),
    
                  onPressed: () {},
                  raduis: 1000.r,
                  child: Text(
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    'Start Your Journey',
                    style: AppTextStyle.font16Medium.copyWith(
                      color: AppColor.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
     ;
  }
}