import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/module/layout_screen/widget/home/widget/meal_plan_card_home.dart';

class PlanCardHome extends StatelessWidget {
  const PlanCardHome({super.key});

  @override
  Widget build(BuildContext context) {
    final mealPlans = [
      {
        'imagePath': 'assets/images/svg/weekly_fresh.svg',
        'title': 'Weekly Fresh',
        'subtitle': 'Perfect for weekly meal planning',
      },
      {
        'imagePath': 'assets/images/svg/monthly_fresh.svg',
        'title': 'Monthly Value',
        'subtitle': 'Best value for regular customers',
      },
      {
        'imagePath': 'assets/images/svg/custom_fresh.svg',
        'title': 'Build Your Own Plan',
        'subtitle': 'Flexibility to match your lifestyle',
      },
    ];

    return SliverPadding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          final plan = mealPlans[index];

          return Padding(
            padding: EdgeInsets.only(
              bottom: index < plan.length - 1 ? 16.h : 32.h,
            ),
            child: MealPlanCard(
              color:
                  index < plan.length - 1
                      ? AppColor.white
                      : AppColor.lightCoral,
              imagePath: plan['imagePath']!,
              title: plan['title']!,
              subtitle: plan['subtitle']!,
            ),
          );
        }, childCount: mealPlans.length),
      ),
    );
  }
}
