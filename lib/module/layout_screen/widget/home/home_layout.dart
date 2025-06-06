import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';
import 'package:gutty/module/layout_screen/widget/home/widget/header_home.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> mealPlans = [
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
    ];

    return CustomScrollView(
      slivers: [
        // Custom App Bar
        SliverAppBar(
          centerTitle: true,
          scrolledUnderElevation: 0,

          // pinned: true,
          expandedHeight: 0,
          floating: true,
          actions: [
            IconButton(
              style: Theme.of(context).iconButtonTheme.style,
              onPressed: () {},
              icon: const Icon(Icons.person_outline),
            ),
          ],
          title: Transform.translate(
            offset: Offset(0, 6.h),
            child: SvgPicture.asset(
              'assets/images/svg/logo.svg',
              width: 181.w,
              height: 101.h,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(0),
            child: Container(color: AppColor.grey, height: 1.h),
          ),
        ),

        // Top spacing
        SliverToBoxAdapter(child: SizedBox(height: 51.h)),

        // Header Home
        const SliverToBoxAdapter(child: HeaderHome()),

        // Spacing after header
        SliverToBoxAdapter(child: SizedBox(height: 24.h)),

        // Title with padding
        SliverPadding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          sliver: SliverToBoxAdapter(
            child: Text('Choose Your Plan', style: AppTextStyle.font20Bold),
          ),
        ),

        // Spacing after title
        SliverToBoxAdapter(child: SizedBox(height: 19.h)),

        // Meal Plan Cards
        SliverPadding(
          padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              final plan = mealPlans[index];
              return Padding(
                padding: EdgeInsets.only(
                  bottom: index < mealPlans.length - 1 ? 16.h : 24.h,
                ),
                child: MealPlanCard(
                  imagePath: plan['imagePath']!,
                  title: plan['title']!,
                  subtitle: plan['subtitle']!,
                ),
              );
            }, childCount: mealPlans.length),
          ),
        ),
      ],
    );
  }
}

class MealPlanCard extends StatelessWidget {
  const MealPlanCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });

  final String imagePath;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsetsDirectional.zero,
      color: Colors.white,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      elevation: 0.1,
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r)),
        width: double.infinity,
        height: 232.h,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(imagePath, fit: BoxFit.fill, height: 120.h,),
            SizedBox(height: 19.h),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyle.font16Bold),
                  SizedBox(height: 7.h),
                  Text(
                    subtitle,
                    style: AppTextStyle.font14Regular.copyWith(
                      color: AppColor.charcoalGray,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
