import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';

class IngrediantList extends StatelessWidget {
  const IngrediantList({super.key});

  @override
  Widget build(BuildContext context) {
    return      SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            'Grilled Chicken ',
                            style: AppTextStyle.font16Medium,
                          ),
                          Text(
                            '150g',
                            style: AppTextStyle.font14Regular.copyWith(
                              color: AppColor.slateGrey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      spacing: 5.w,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove),
                          style: Theme.of(
                            context,
                          ).iconButtonTheme.style!.copyWith(
                            backgroundColor: WidgetStateProperty.all(
                              AppColor.grey.withValues(alpha: 0.5),
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                          style: Theme.of(
                            context,
                          ).iconButtonTheme.style!.copyWith(
                            iconColor: WidgetStateProperty.all(Colors.white),
                            backgroundColor: WidgetStateProperty.all(
                              AppColor.primary,
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }, childCount: 10),
          )

       ;
  }
}