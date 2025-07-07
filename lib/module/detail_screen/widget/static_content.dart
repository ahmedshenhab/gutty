import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import '../../../core/ui/style/app_text_style.dart';
import 'nutrition_fact.dart';

class StaticContent extends StatelessWidget {
  const StaticContent({super.key, required this.map});
  final Map<String, dynamic> map;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: map['heroTag']!,
            child: Image.asset(
              map['imagePath']!,
              width: double.infinity,
              height: 320.h,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 18.h),
                Text(
                  map['meal'].name ?? 'default',
                  style: AppTextStyle.font22Medium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 8.h),
                Row(
                  children: [
                    Icon(
                      Icons.star_border_outlined,
                      size: 15.h,
                      color: AppColor.primary,
                    ),
                    SizedBox(width: 4.w),
                    Text('4.8', style: AppTextStyle.font14Regular),
                    SizedBox(width: 3.w),
                    Text(
                      ' (123 reviews)',
                      style: AppTextStyle.font14Regular.copyWith(
                        color: AppColor.slateGrey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 55.h),
              ],
            ),
          ),

           NutritionFacts(meal:  map['meal'],),
        ],
      ),
    );
  }
}
