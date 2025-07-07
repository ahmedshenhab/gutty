import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/module/layout_screen/widget/menu/data/model/meal_menu_model.dart';
import '../../../core/ui/style/app_color.dart';
import '../../../core/ui/style/app_text_style.dart';
import 'item_nutrition_facts.dart';

class NutritionFacts extends StatelessWidget {
  const NutritionFacts({super.key, required this.meal});
  final MealMenuModel meal;

  @override
  Widget build(BuildContext context) {
    final List<ItemNutritionFact> nutritionItems = [
      ItemNutritionFact(
        svgPath: 'assets/images/svg/calories.svg',
        value: meal.calories.toString(),
        unit: 'kcal',
        label: 'Calories',
      ),
      ItemNutritionFact(
        svgPath: 'assets/images/svg/protien.svg',
        value: meal.proteins.toString(),
        unit: 'g',
        label: 'Protien',
      ),
      ItemNutritionFact(
        svgPath: 'assets/images/svg/carb.svg',
        value: meal.carbs.toString(),
        unit: 'g',
        label: 'Carbs',
      ),
      ItemNutritionFact(
        svgPath: 'assets/images/svg/fats.svg',
        value: meal.fats.toString(),
        unit: 'g',
        label: 'Fats',
      ),
      ItemNutritionFact(
        svgPath: 'assets/images/svg/fats.svg',
        value: meal.weight.toString(),
        unit: 'g',
        label: 'Weight',
      ),
      ItemNutritionFact(
        svgPath: 'assets/images/svg/fats.svg',
        value: meal.fibers.toString(),
        unit: 'g',
        label: 'Fibers',
      ),
    ];

    return Container(
      width: double.infinity,
      height: 170.h,
      color: AppColor.grey50,

      child: Column(
        spacing: 15.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),

          Padding(
            padding: EdgeInsetsDirectional.only(start: 16.w),
            child: Text('Nutritional Facts', style: AppTextStyle.font18Medium),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: nutritionItems.length,
              scrollDirection: Axis.horizontal,
              itemBuilder:
                  (context, index) => Padding(
                    padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
                    child: ItemNutritionFact(
                      svgPath: nutritionItems[index].svgPath,
                      value: nutritionItems[index].value,
                      unit: nutritionItems[index].unit,
                      label: nutritionItems[index].label,
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
