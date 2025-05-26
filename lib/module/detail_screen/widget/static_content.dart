import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';
import 'package:gutty/module/detail_screen/widget/nutrition_fact.dart';

class  StaticContent extends StatelessWidget {
  const  StaticContent({super.key});

  @override
  Widget build(BuildContext context) {
    return   SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/png/meal.png',
                  width: double.infinity,
                  height: 320.h,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 10.h,
                  ),
                  child: Text(
                    'Grilled Chicken Quinoa Bowl',
                    style: AppTextStyle.font22Medium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const NutritionFacts(),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 16.h,
                  ),
                  child: Text('Ingredients', style: AppTextStyle.font18Medium),
                ),
              ],
            ),
          )

       ;
  }
}