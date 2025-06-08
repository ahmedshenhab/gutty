import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/module/layout_screen/widget/menu/cubit/menu_cubit.dart';
import '../ui/style/app_color.dart';
import '../ui/style/app_text_style.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        MenuCubit.get(context).searchByName(value);
      },
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, size: 16.h, color: AppColor.grey400),
        fillColor: AppColor.grey100,

        filled: true,

        hintText: hintText,
        hintStyle: AppTextStyle.font14Regular.copyWith(color: AppColor.grey400),

        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(8.r),
        ),
      ),
    );
  }
}
