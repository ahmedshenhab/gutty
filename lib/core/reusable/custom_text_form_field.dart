import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/app_color.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onSubmit,
    required this.controller,
    required this.prefixIconButton,

    this.labelText,
    this.readOnly = false,
    this.isHiddenPassword = false,
    this.suffixIconButton,
    required this.validator,
    this.type,
    this.onTap,
    this.hintText,
    this.hintStyle,
    this.textStyle,
  });

  final void Function(String)? onSubmit;
  final void Function()? onTap;
  final TextEditingController controller;

  final Widget prefixIconButton;

  final String? labelText;
  final String? hintText;
  final bool readOnly;

  final bool? isHiddenPassword;
  final Widget? suffixIconButton;
  final String? Function(String?) validator;
  final TextInputType? type;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      
      autovalidateMode: AutovalidateMode.disabled,
      style:
          textStyle ??
          AppTextStyle.font16Regular.copyWith(
            color: Colors.black.withValues(alpha: 0.7),
          ),



      readOnly: readOnly,
      onTap: onTap,
      onFieldSubmitted: onSubmit,
      obscureText: isHiddenPassword ?? false,
      controller: controller,
      keyboardType: type ?? TextInputType.text,
      validator: validator,
      cursorColor: AppColor.black, // ✅ Replace teal

      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.w),
        floatingLabelBehavior:
            readOnly ? FloatingLabelBehavior.never : FloatingLabelBehavior.auto,

        labelText: labelText,
        filled: true,
        fillColor: AppColor.white,
        hintText: hintText,
        hintStyle:
            hintStyle ??
            AppTextStyle.font16Regular.copyWith(color: AppColor.grey400),

        // labelStyle: AppTextStyle.regular14.copyWith(color: AppColor.grey),
        // floatingLabelStyle: AppTextStyle.regular14,
        suffixIcon: suffixIconButton,
        prefixIcon: prefixIconButton,

        errorMaxLines: 3,
        errorStyle: AppTextStyle.font12Regular,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColor.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: Colors.grey),
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(
            color: readOnly ? AppColor.grey : AppColor.grey,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColor.grey),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: const BorderSide(color: AppColor.grey),
        ),
      ),
    );
  }
}
