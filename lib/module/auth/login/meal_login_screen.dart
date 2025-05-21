import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/ui/style/app_color.dart';
import 'cubit/cubit.dart';
import 'widget/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String loginScreen = '/loginScreen';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,

        title: SvgPicture.asset('assets/images/svg/logo.svg', height: 50.h),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 12.w, right: 12.w),
              padding: EdgeInsets.only(top: 15.h),
              decoration: BoxDecoration(
                color: AppColor.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45.r),
                  topRight: Radius.circular(45.r),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text(
                      '',
                      style: theme.textTheme.bodyMedium!.copyWith(
                        fontFamily: 'Poppins',
                        fontSize: 24.sp,

                        color: AppColor.black,
                      ),
                    ),
                    SizedBox(height: mediaQuery.size.height * 0.06),

                    //login form
                    const LoginForm(),
                    SizedBox(height: mediaQuery.size.height * 0.06),

                    // Log In Button
                    ElevatedButton(
                      onPressed: () {
                        BlocProvider.of<LoginCubit>(context).loginUser();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(mediaQuery.size.width * 0.86, 48.h),
                        // backgroundColor: Colors.deepOrange,
                        padding: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                      ),
                      child: Text(
                        '',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontFamily: 'SofiaSans',
                          fontSize: 20.sp,
                          color: AppColor.white,
                        ),
                      ),
                    ),

                    SizedBox(height: mediaQuery.size.height * 0.038),

                    RichText(
                      text: TextSpan(
                        text: '',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontFamily: 'SofiaSans',
                          fontSize: 14.sp,
                          // height: 0,
                        ),
                        children: [
                          TextSpan(
                            text: '',
                            style: theme.textTheme.bodyMedium!.copyWith(
                              decoration: TextDecoration.underline,
                              decorationThickness: 0.7.w,
                              fontFamily: 'SofiaSans',
                              fontSize: 18.sp,

                              // height: 0,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigator.of(
                                    //   context,
                                    // ).pushReplacementNamed(
                                    //   MealRegisterScreen.registerScreen,
                                    // );
                                  },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
