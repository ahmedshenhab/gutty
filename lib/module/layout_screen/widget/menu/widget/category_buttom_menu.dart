import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';
import 'package:gutty/module/layout_screen/widget/menu/cubit/menu_cubit.dart';

class CategoryButtomMenu extends StatelessWidget {
  const CategoryButtomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = MenuCubit.get(context);
    return    SizedBox(
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
                              current is ChangeCategoryIndexState,
                      builder: (context, state) {
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
          )
       ;
  }
}