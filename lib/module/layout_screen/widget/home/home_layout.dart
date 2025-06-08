import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/module/layout_screen/widget/home/widget/deliver_options_home.dart';
import 'package:gutty/module/layout_screen/widget/home/widget/app_bar_home.dart';
import 'package:gutty/module/layout_screen/widget/home/widget/plan_card_home.dart';
import '../../../../core/ui/style/app_text_style.dart';
import 'widget/header_home.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final howWorks = [
      {
        'imagePath': 'assets/images/svg/choice_menu.svg',
        'title': 'Choose Your Plan',
      },
      {
        'imagePath': 'assets/images/svg/shouka.svg',
        'title': 'Customize Your Meals',
      },
      {
        'imagePath': 'assets/images/svg/icon_calender.svg',
        'title': 'Select Delivery Schedule',
      },
      {'imagePath': 'assets/images/svg/carb.svg', 'title': 'Enjoy Fresh Meals'},
    ];
    return CustomScrollView(
      slivers: [
        // Custom App Bar
        const AppBarHome(),
        // Top spacing
        SliverToBoxAdapter(child: SizedBox(height: 50.h)),

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

        SliverToBoxAdapter(child: SizedBox(height: 19.h)),

        // Meal Plan Cards
        const PlanCardHome(),

        const DeliverOptionsHome(),
        SliverToBoxAdapter(child: SizedBox(height: 32.h)),
        SliverToBoxAdapter(
          child: Container(
            height: 268.h,
            color: AppColor.grey50,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 26.h),
                Padding(
                  padding: EdgeInsetsDirectional.only(start: 20.w),
                  child: Text('How It Works', style: AppTextStyle.font20Bold),
                ),
                SizedBox(height: 16.h),

                Padding(
                  padding: EdgeInsetsDirectional.only(start: 16.w),
                  child: Column(
                    children:
                        howWorks
                            .map(
                              (e) => Padding(
                                padding: EdgeInsetsDirectional.only(
                                  bottom: 16.h,
                                ),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 16.w,
                                      backgroundColor: AppColor.primary,
                                      child: SvgPicture.asset(
                                        colorFilter: const ColorFilter.mode(
                                          AppColor.white,
                                          BlendMode.srcIn,
                                        ),
                                        e['imagePath']!,
                                        width: 18.w,
                                        height: 18.h,
                                      ),
                                    ),
                                    SizedBox(width: 16.w),
                                    Text(
                                      e['title']!,
                                      style: AppTextStyle.font16Medium,
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),

        SliverToBoxAdapter(child: SizedBox(height: 300.h)),
      ],
    );
  }
}
