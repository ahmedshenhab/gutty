
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';
import 'package:gutty/module/layout_screen/widget/menu/widget/item_fact.dart';
import 'package:gutty/module/layout_screen/widget/menu/widget/item_ingredient.dart';

class ItemMenue extends StatelessWidget {
  const ItemMenue({super.key});

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
          Image.asset('assets/images/png/m2.png'),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(left: 12.w, right: 12.w),
            child: Text(
              'Grilled Chicken Bowl',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.font16Medium,
            ),
          ),

          // Facts grid replaced with Wrap for better performance (no scroll)
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 12.w,
              end: 12.w,
              top: 20.h,
              bottom: 10.h,
            ),
            child: Wrap(
              spacing: 12.w,
              runSpacing: 4.h,
              children: const [
                Itemfact(number: '450', mesure: 'kcal'),
                Itemfact(number: '35g', mesure: 'protein'),
                Itemfact(number: '12g', mesure: 'fats'),
                Itemfact(number: '48g', mesure: 'carbs'),
              ],
            ),
          ),

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

          // Ingredients list replaced with Column (no scroll)
          Padding(
            padding: EdgeInsetsDirectional.only(
              start: 12.w,
              end: 12.w,
              top: 9.h,
            ),
            child: Column(
              children: List.generate(
                6,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: 5.h),
                  child: const ItemIngredient(
                    text: 'Grilled chicken breast',
                    number: '150g',
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
