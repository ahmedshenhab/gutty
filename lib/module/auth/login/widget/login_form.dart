import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/reg_ex.dart';
import '../../../../core/ui/style/app_color.dart';
import '../../../../core/ui/style/app_text_style.dart';
import '../../../../generated/l10n.dart';
import '../../custom_title_and_custom_field.dart';
import '../cubit/cubit.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final cubit = LoginCubit.get(context);
    final localization = S.of(context);

    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: cubit.formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //phone
          CustomTitleAndCustomField(
            type:  TextInputType.phone,
            
            hintStyle: AppTextStyle.font14Regular.copyWith(
              color: AppColor.darkgray,
            ),
            prefixIcon: Icons.phone_android_outlined,
            controller: cubit.phoneNumberController,
            title: localization.phoneNumber,

            validator: (value) {
              if (value == null || value.isEmpty) {
                return localization.enterPhone;
              }

              else if (!RegEx.regphone.hasMatch(value )) {
                return localization.enterValidphone;
                
              }
               return null;
            },
            hintText: localization.enterPhone,
          ),

          SizedBox(height: 29.h),
          //password
          CustomTitleAndCustomField(
            type:  TextInputType.visiblePassword,
            hintStyle: AppTextStyle.font14Regular.copyWith(
              color: AppColor.darkgray,
            ),
            isHiddenPassword: isPasswordVisible,
            suffixIconButton: IconButton(
              icon: Icon(
                color: AppColor.darkgray,
                isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                size: 18.h,
              ),
              onPressed: () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              },
            ),
            prefixIcon: Icons.person_2_outlined,

            controller: cubit.passwordController,
            title: localization.password,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localization.enterPassword;
              }

              else if (!RegEx.regpassword.hasMatch(value)) {
                return localization.enterValidPassword;
              }
               return null;
            },
            hintText: localization.password,
          ),
        ],
      ),
    );
  }
}
