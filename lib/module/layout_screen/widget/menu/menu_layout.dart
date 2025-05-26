import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';

class MenuLayout extends StatelessWidget {
  const MenuLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: 170.w,
        height: 420.h,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/png/m2.png', width: double.infinity),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                'Grilled Chicken Bowl',
                style: AppTextStyle.font16Medium,
              ),
            ),

            GridView.custom(
              padding: EdgeInsetsDirectional.only(
                start: 10.w,
                end: 7.w,
                top: 10.h,
                bottom: 10.h,
              ),
              shrinkWrap: true,

              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 20.h,
                crossAxisCount: 2,
              ),

              childrenDelegate: SliverChildListDelegate([
                const Itemfact(number: '450', mesure: 'kcal'),
                const Itemfact(number: '35g', mesure: 'protein'),
                const Itemfact(number: '12g', mesure: 'fats'),
                const Itemfact(number: '48g', mesure: 'carbs'),
              ]),
            ),

            Divider(
              color: AppColor.primary.withValues(alpha: 0.6),
              thickness: 1,
              indent: 10.w,
              endIndent: 10.w,
            ),

            Padding(
              padding: EdgeInsetsDirectional.only(start: 10.w),
              child: Text(
                'Ingredients',
                style: AppTextStyle.font12Medium.copyWith(
                  color: AppColor.primary,
                ),
              ),
            ),

            Flexible(
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsetsDirectional.only(
                  start: 10.w,
                  end: 10.w,
                  top: 5.h,
                ),
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(height: 5.h),

                itemBuilder: (context, index) {
                  return const ItemIngredient(
                    text: 'Grilled chicken breast',
                    number: '150g',
                  );
                },

                itemCount: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemIngredient extends StatelessWidget {
  const ItemIngredient({super.key, required this.text, required this.number});
  final String text;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 3,
          child: Text(
            maxLines: 2,

            overflow: TextOverflow.ellipsis,
            text,
            style: AppTextStyle.font12Regular.copyWith(
              color: AppColor.charcoalGray,
            ),
          ),
        ),
        Flexible(
          child: Text(
            maxLines: 1,

            overflow: TextOverflow.ellipsis,

            number,
            style: AppTextStyle.font12Medium.copyWith(
              color: AppColor.charcoalGray,
            ),
          ),
        ),
      ],
    );
  }
}

class Itemfact extends StatelessWidget {
  const Itemfact({super.key, required this.number, required this.mesure});
  final String number;
  final String mesure;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            number,
            style: AppTextStyle.font12Medium.copyWith(
              color: AppColor.charcoalGray,
            ),
          ),
        ),
        SizedBox(width: 2.3.w),
        Flexible(
          child: Text(
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            mesure,
            style: AppTextStyle.font12Regular.copyWith(
              color: AppColor.charcoalGray,
            ),
          ),
        ),
      ],
    );
  }
}
