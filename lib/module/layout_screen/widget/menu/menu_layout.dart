import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/module/detail_screen/detail_screen.dart';
import 'package:gutty/module/layout_screen/widget/menu/widget/category_buttom_menu.dart';
import 'cubit/menu_cubit.dart';
import 'widget/item_menu.dart';
import 'widget/search_and_filter_menu.dart';

class MenuLayout extends StatelessWidget {
  const MenuLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          const SearchAndFilterMenu(),
          SizedBox(height: 24.h),

          // Categories
          const CategoryButtomMenu(),
          SizedBox(height: 20.h),

          BlocBuilder<MenuCubit, MenuState>(
            buildWhen:
                (previous, current) =>
                    current is MenuLoadingState ||
                    current is MenuErrorState ||
                    current is MenuSuccessState,
            builder: (context, state) {
              switch (state) {
                case MenuLoadingState():
                  return const Expanded(
                    child: Center(child: CircularProgressIndicator()),
                  );
                case MenuErrorState():
                  return Expanded(child: Center(child: Text(state.error)));

                case MenuSuccessState():
                  return Expanded(
                    child: CustomScrollView(
                      slivers: [
                        // Search
                        SliverGrid(
                          delegate: SliverChildBuilderDelegate((
                            context,
                            index,
                          ) {
                            const imagePath =
                                'assets/images/png/m2.png'; // replace with actual data later
                            final heroTag = 'meal-image-$index';
                            return GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  DetailScreen.routeName,
                                  arguments: {
                                    'imagePath': imagePath,
                                    'heroTag': heroTag,
                                    "meal": state.meals[index],
                                  },
                                );
                              },

                              child: ItemMenue(
                                heroTag: heroTag,
                                imagePath: imagePath,
                                meal: state.meals[index],
                              ),
                            );
                          }, childCount: 10),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.w,
                                mainAxisSpacing: 16.h,

                                childAspectRatio: 0.37,
                              ),
                        ),
                      ],
                    ),
                  );

                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}
