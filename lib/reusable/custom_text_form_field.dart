import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/ui/style/App_font_weight.dart';
import 'package:gutty/core/ui/style/app_color.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onSubmit,
    required this.controller,
    this.hintText,
    this.labelText,
    this.readOnly = false,
    this.isHiddenPassword = false,
    this.suffixIconButton,
    required this.validator,
    this.type,
  });

  final void Function(String)? onSubmit;
  final TextEditingController controller;
  final String? hintText;
  final String? labelText;
  final bool readOnly;
  final bool isHiddenPassword;
  final Widget? suffixIconButton;
  final String? Function(String?) validator;
  final TextInputType? type;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.disabled,
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight: AppFontWeight.regular,
        color: Colors.black87,
      ),
      readOnly: readOnly,
      onFieldSubmitted: onSubmit,
      obscureText: isHiddenPassword,
      controller: controller,
      keyboardType: type ?? TextInputType.text,
      validator: validator,
      cursorColor: AppColor.black, // ✅ Replace teal
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[100],
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500], fontSize: 13.sp),
        labelText: labelText,
        labelStyle: TextStyle(fontSize: 13.sp, color: Colors.grey[700]),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        suffixIcon: suffixIconButton,
        errorMaxLines: 2,
        errorStyle: TextStyle(
          fontSize: 11.sp,
          fontWeight: FontWeight.w500,
          color: Colors.red.shade700,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: const BorderSide(color: AppColor.primary),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
      ),
    );
  }
}
