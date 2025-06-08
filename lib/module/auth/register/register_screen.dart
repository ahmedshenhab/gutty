import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/reusable/custom_elevated_button.dart';
import '../../../core/ui/style/app_color.dart';
import '../../../core/ui/style/app_text_style.dart';
import '../../../generated/l10n.dart';
import '../login/meal_login_screen.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'widget/register_form.dart';
import 'widget/register_listner.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const String routeName = '/RegisterScreen';

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
                  loc.signUpToContinue,
                  style: AppTextStyle.font16Regular.copyWith(
                    color: AppColor.darkgray,
                  ),
                ),

                SizedBox(height: mediaQuery.size.height * 0.03),
                const RegisterForm(),
                SizedBox(height: mediaQuery.size.height * 0.04),

                // Sign Up Button
                BlocBuilder<RegisterCubit, MealRegisterStates>(
                  buildWhen:
                      (previous, current) =>
                          current is MealRegisterLoadingState ||
                          current is MealRegisterSuccessState ||
                          current is MealRegisterErrorState,
                  builder: (context, state) {
                    return CustomElevatedButton(
                      onPressed:
                          state is MealRegisterLoadingState
                              ? null
                              : () {
                                RegisterCubit.get(context).registerUser();
                              },
                      child:
                          state is MealRegisterLoadingState
                              ? const CircularProgressIndicator()
                              : Text(
                                loc.signUp,
                                style: AppTextStyle.font16Regular.copyWith(
                                  color: AppColor.white,
                                ),
                              ),
                    );
                  },
                ),

                SizedBox(height: 16.h),

                // Have Account? Sign In
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      loc.alreadyHaveAccount,
                      style: AppTextStyle.font14Regular.copyWith(
                        color: AppColor.darkgray,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigate to login screen
                        Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                        // Or use your preferred navigation method:
                        // Navigator.pop(context);
                      },
                      child: Text(
                        loc.signIn,
                        style: AppTextStyle.font16Bold.copyWith(
                          color: AppColor.primary,

                          decoration: TextDecoration.underline,
                          decorationColor: AppColor.primary,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: mediaQuery.size.height * 0.02),
                const RegisterListner(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
