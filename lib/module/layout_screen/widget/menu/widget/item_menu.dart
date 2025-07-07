import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/module/layout_screen/widget/menu/data/model/meal_menu_model.dart';
import '../../../../../core/ui/style/app_color.dart';
import '../../../../../core/ui/style/app_text_style.dart';
import 'item_fact.dart';
import 'item_ingredient.dart';

class ItemMenue extends StatelessWidget {
  const ItemMenue({
    super.key,
    required this.imagePath,
    required this.heroTag,
    required this.meal,
  });

  final String imagePath;
  final String heroTag;
  final MealMenuModel meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      clipBehavior: Clip.hardEdge,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(tag: heroTag, child: Image.asset(imagePath)),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: Text(
              meal.name ?? 'default',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.font16Medium,
            ),
          ),

          Padding(
            padding: EdgeInsetsDirectional.only(start: 12.w, top: 20.h),
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              childAspectRatio: 3,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Itemfact(number: '${meal.calories}', mesure: 'kcal'),
                Itemfact(number: '${meal.proteins}g', mesure: 'protein'),
                Itemfact(number: '${meal.fats}g', mesure: 'fats'),
                Itemfact(number: '${meal.carbs}g', mesure: 'carbs'),
              ],
            ),
          ),

          SizedBox(height: 10.h), // Add spacing after facts

          Divider(
            color: AppColor.primary.withAlpha(80),
            thickness: 1,
            indent: 12.w,
            endIndent: 12.w,
          ),

          Padding(
            padding: EdgeInsetsDirectional.only(start: 12.w),
            child: Text(
              'Ingredients',
              style: AppTextStyle.font12Medium.copyWith(
                color: AppColor.primary,
              ),
            ),
          ),

          // Ingredients list
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 12.w,
              end: 12.w,
              top: 9.h,
            ),
            child: Column(
              children: List.generate(
                meal.recipeIngredients?.take(6).length ?? 0,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: ItemIngredient(
                    text:
                        meal.recipeIngredients?.take(6).toList()[index].name ??
                        'default',
                    number:
                        '${meal.recipeIngredients?.take(6).toList()[index].quantity}g',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
