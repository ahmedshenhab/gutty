
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/reusable/custom_text_form_field.dart';
import '../../core/ui/style/app_color.dart';
import '../../core/ui/style/app_text_style.dart';

class CustomTitleAndCustomField extends StatelessWidget {
  const CustomTitleAndCustomField({
    super.key,
    required this.controller,
    required this.title,
    required this.validator,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIconButton,
    this.isHiddenPassword,
    this.hintStyle, required this.type,
  });
  final TextEditingController controller;
  final String title;
  final String? Function(String?) validator;
  final String hintText;
  final IconData prefixIcon;
  final Widget? suffixIconButton;
  final bool? isHiddenPassword;
  final TextStyle? hintStyle;
  final TextInputType type;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.font14Regular.copyWith(color: AppColor.darkgray),
        ),
        SizedBox(height: 6.h),
        CustomTextFormField(
          hintStyle: hintStyle,
          isHiddenPassword: isHiddenPassword,
          suffixIconButton: suffixIconButton,
          prefixIconButton: Icon(
            prefixIcon,
            color: AppColor.darkgray,
            size: 20.w,
          ),
          hintText: hintText,
          controller: controller,

          type: type ,
          validator: validator,
        ),
      ],
    );
  }
}
