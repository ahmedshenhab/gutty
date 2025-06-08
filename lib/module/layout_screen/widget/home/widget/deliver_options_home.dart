import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';

class DeliverOptionsHome extends StatelessWidget {
  const DeliverOptionsHome({super.key});

  @override
  Widget build(BuildContext context) {
    final flexableDelivery = [
      {'imagePath': 'assets/images/svg/fats.svg', 'title': 'Every 2 Days'},
      {
        'imagePath': 'assets/images/svg/icon_calender.svg',
        'title': 'Every 3 Days',
      },
      {'imagePath': 'assets/images/svg/carb.svg', 'title': 'Every Weekly'},
    ];
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Flexible Delivery Options', style: AppTextStyle.font20Bold),
            SizedBox(height: 19.h),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 8.w,
                children:
                    flexableDelivery
                        .map(
                          (e) => Container(
                            padding: EdgeInsets.symmetric(horizontal: 14.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: AppColor.grey200,
                                width: 1.w,
                              ),
                            ),
                            width: 111.w,
                            height: 98.h,
                            child: Column(
                              children: [
                                SizedBox(height: 16.h),
                                SvgPicture.asset(
                                  e['imagePath']!,
                                  width: 19.5.w,
                                  height: 18.h,
                                ),
                                SizedBox(height: 10.h),
                                Text(
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,

                                  e['title']!,
                                  style: AppTextStyle.font14Medium,
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
