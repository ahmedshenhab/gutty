import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/reusable/custom_search_field.dart';
import 'package:gutty/core/ui/style/app_color.dart';

class SearchAndFilterMenu extends StatelessWidget {
  const SearchAndFilterMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 44.h,
            child: const CustomSearchBar(hintText: 'Search Meals...'),
          ),
        ),
        SizedBox(width: 12.w),
        Container(
          width: 40.w,
          height: 44.h,
          decoration: BoxDecoration(
            color: AppColor.grey100,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(Icons.filter_list, color: AppColor.primary, size: 20.h),
        ),
      ],
    );
  }
}
