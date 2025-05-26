import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';
import 'package:gutty/module/detail_screen/widget/item_nutrition_facts.dart';

class NutritionFacts extends StatelessWidget {
  const NutritionFacts({super.key});

  @override
  Widget build(BuildContext context) {
    return     Container(
            width: double.infinity,
            height: 170.h,
            color: AppColor.grey.withValues(alpha: 0.4),

            child: Column(
              spacing: 15.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.h),

                Padding(
                  padding: EdgeInsetsGeometry.symmetric(horizontal: 10.w),
                  child: Text(
                    'Nutritional Facts',
                    style: AppTextStyle.font18Medium,
                  ),
                ),

                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ItemNutritionFact(
                      svgPath: 'assets/images/svg/calories.svg',
                      value: '450',
                      unit: 'kcal',
                      label: 'Calories',
                    ),
                    ItemNutritionFact(
                      svgPath: 'assets/images/svg/protien.svg',
                      value: '45',
                      unit: 'g',
                      label: 'Protien',
                    ),
                    ItemNutritionFact(
                      svgPath: 'assets/images/svg/carb.svg',
                      value: '48',
                      unit: 'g',
                      label: 'Carbs',
                    ),
                    ItemNutritionFact(
                      svgPath: 'assets/images/svg/fats.svg',
                      value: '45',
                      unit: 'g',
                      label: 'Fats',
                    ),
                  ],
                ),
              ],
            ),
          )
       ;
  }
}