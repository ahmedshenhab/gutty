import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/reusable/custom_elevated_button.dart';
import 'package:gutty/module/layout_screen/widget/menu/data/model/meal_menu_model.dart';
import '../../../core/ui/style/app_color.dart';
import '../../../core/ui/style/app_text_style.dart';

class IngrediantList extends StatelessWidget {
  const IngrediantList({super.key, required this.meal});
  final MealMenuModel meal;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: meal.recipeIngredients?.length ?? 0,
        (context, index) {
          return Padding(
            padding: EdgeInsetsDirectional.only(bottom: 19.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.62,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,

                        meal.recipeIngredients?[index].name ?? 'default',
                        style: AppTextStyle.font16Medium,
                      ),
                      SizedBox(height: 3.h),
                      Text(
                        overflow: TextOverflow.ellipsis,

                        '${meal.recipeIngredients?[index].quantity}g',
                        style: AppTextStyle.font14Regular.copyWith(
                          color: AppColor.slateGrey,
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [
                    CustomElevatedButton(
                      bacgroundColor: AppColor.grey100,

                      fixedHeight: 33.h,
                      fixedwidth: 33.w,
                      onPressed: () {},
                      child: const Icon(
                        Icons.remove,
                        color: AppColor.charcoalGray,
                      ),
                    ),

                    SizedBox(width: 12.w),
                    CustomElevatedButton(
                      fixedHeight: 33.h,
                      fixedwidth: 33.w,

                      onPressed: () {},
                      child: const Icon(Icons.add, color: AppColor.white),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
