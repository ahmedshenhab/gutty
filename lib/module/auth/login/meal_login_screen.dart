import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/reusable/custom_elevated_button.dart';
import '../../../core/ui/style/app_color.dart';
import '../../../core/ui/style/app_text_style.dart';
import '../../../generated/l10n.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'widget/login_listner.dart';
import '../register/register_screen.dart';
import 'widget/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String routeName = '/loginScreen';

  @override
  Widget build(BuildContext context) {
    final loc = S.of(context);

    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/images/svg/logo.svg',
                  width: mediaQuery.size.width * 0.7,
                  height: mediaQuery.size.height * 0.15,
                ),
                Text(loc.welcom, style: AppTextStyle.font24Regular),
                Text(
                  loc.signInToContinue,
                  style: AppTextStyle.font16Regular.copyWith(
                    color: AppColor.darkgray,
                  ),
                ),

                SizedBox(height: 53.h),
                const LoginForm(),
                SizedBox(height: 32.h),

                // Sign In Button
                BlocBuilder<LoginCubit, MealLoginStates>(
                  buildWhen:
                      (previous, current) =>
                          current is MealLoginLoadingState ||
                          current is MealLoginSuccessState ||
                          current is MealLoginErrorState,
                  builder: (context, state) {
                    return CustomElevatedButton(
                      onPressed:
                          state is MealLoginLoadingState
                              ? null
                              : () {
                                LoginCubit.get(context).loginUser();
                              },
                      child:
                          state is MealLoginLoadingState
                              ? const CircularProgressIndicator()
                              : Text(
                                loc.signIn,
                                style: AppTextStyle.font16Regular.copyWith(
                                  color: AppColor.white,
                                ),
                              ),
                    );
                  },
                ),

                SizedBox(height: 16.h),

                // Don't Have Account? Sign Up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      loc.dontHaveAccount,
                      style: AppTextStyle.font14Regular.copyWith(
                        color: AppColor.darkgray,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to register screen
                        Navigator.pushReplacementNamed(context, RegisterScreen.routeName);
                        // Or use your preferred navigation method
                      },
                      child: Text(
                        loc.signUp,
                        style: AppTextStyle.font16Bold.copyWith(
                          color: AppColor.primary,

                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.primary,
                        ),
                      ),
                    ),
                  ],
                ),

                const LoginListner(),

                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
