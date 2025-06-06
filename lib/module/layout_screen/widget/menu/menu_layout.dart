import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';
import 'package:gutty/module/layout_screen/widget/menu/cubit/menu_cubit.dart';
import 'package:gutty/module/layout_screen/widget/menu/widget/item_menu.dart';
import 'package:gutty/module/layout_screen/widget/menu/widget/search_and_filter_menu.dart';

class MenuLayout extends StatelessWidget {
  const MenuLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MenuCubit.get(context);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          const SearchAndFilterMenu(),
          SizedBox(height: 24.h),

          // Categories
          SizedBox(
            height: 40.h,

            child: ListView.builder(
              itemCount: cubit.categories.length,
              itemBuilder:
                  (context, index) => Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: index == 0 ? 0 : 12.0.w,
                      end: index == cubit.categories.length - 1 ? 0 : 12.0.w,
                    ),
                    child: BlocBuilder<MenuCubit, MenuState>(
                      buildWhen:
                          (previous, current) =>
                              current is ChangeCategoryIndexState ,
                      builder: (context, state) {
                        log('indssssssssssex $index');
                        return GestureDetector(
                          onTap: () => cubit.changeCategory(index),
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(horizontal: 15.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color:
                                  cubit.currentCategory == index
                                      ? AppColor.primary
                                      : AppColor.grey100,
                            ),

                            height: 40.h,

                            child: Text(
                              cubit.categories[index],
                              style: AppTextStyle.font16Medium.copyWith(
                                color:
                                    cubit.currentCategory == index
                                        ? AppColor.white
                                        : AppColor.charcoalGray,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
              scrollDirection: Axis.horizontal,
            ),
          ),
          SizedBox(height: 20.h),

          Expanded(
            child: CustomScrollView(
              slivers: [
                // Search
                SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => const ItemMenue(),
                    childCount: 10,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.w,
                    mainAxisSpacing: 16.h,
                    childAspectRatio: 0.325.h,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
