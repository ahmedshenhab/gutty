import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/reg_ex.dart';
import '../../../../core/ui/style/app_color.dart';
import '../../../../core/ui/style/app_text_style.dart';
import '../../../../generated/l10n.dart';
import '../../custom_title_and_custom_field.dart';
import '../cubit/cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final cubit = RegisterCubit.get(context);
    final localization = S.of(context);

    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      key: cubit.formState,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //first name
          CustomTitleAndCustomField(
            type:  TextInputType.name,
            hintStyle: AppTextStyle.font14Regular.copyWith(
              color: AppColor.darkgray,
            ),
            prefixIcon: Icons.person_outline_outlined,

            controller: cubit.firstNameController,
            title: localization.firstName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localization.enterFirstName;
              }
                             return null;

            },
            hintText: localization.enterFirstName,
          ),

          SizedBox(height: mediaQuery.size.height * 0.025),

          //middle name
          CustomTitleAndCustomField(
            type:  TextInputType.name,
            hintStyle: AppTextStyle.font14Regular.copyWith(
              color: AppColor.darkgray,
            ),
            prefixIcon: Icons.person_outline_outlined,

            controller: cubit.middleNameController,
            title: localization.middleName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localization.enterMiddleName;
              }
                             return null;

            },
            hintText: localization.enterMiddleName,
          ),

          SizedBox(height: mediaQuery.size.height * 0.025),

          //last name
          CustomTitleAndCustomField(
            type:  TextInputType.name,
            hintStyle: AppTextStyle.font14Regular.copyWith(
              color: AppColor.darkgray,
            ),
            prefixIcon: Icons.person_outline_outlined,

            controller: cubit.lastNameController,
            title: localization.lastName,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localization.enterLastName;
              }
                             return null;       
            },
            hintText: localization.enterLastName,
          ),

          SizedBox(height: mediaQuery.size.height * 0.025),

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
              } else if (!RegEx.regphone.hasMatch(value)) {
                return localization.enterValidphone;
              }
                             return null;

            },
            hintText: localization.enterPhone,
          ),

          SizedBox(height: mediaQuery.size.height * 0.025),

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
              } else if (!RegEx.regpassword.hasMatch(value)) {
                return localization.enterValidPassword;
              }
                             return null;         
            },
            hintText: localization.password,
          ),

          SizedBox(height: mediaQuery.size.height * 0.02),
          // main address
          CustomTitleAndCustomField(
            type:  TextInputType.streetAddress,
            hintStyle: AppTextStyle.font14Regular.copyWith(
              color: AppColor.darkgray,
            ),
            prefixIcon: Icons.location_city,
            controller: cubit.mainAddressController,
            title: localization.mainAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return localization.enterMainAddress;
              }
               return null;
            },
            hintText: localization.enterMainAddress,
          ),
        ],
      ),
    );
  }
}
