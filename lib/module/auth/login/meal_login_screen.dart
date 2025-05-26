import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gutty/core/ui/style/app_text_style.dart';
import 'package:gutty/generated/l10n.dart';
import 'package:gutty/reusable/custom_elevated_button.dart';
import 'widget/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  static const String loginScreen = '/loginScreen';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final loc = S.of(context);

    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset('assets/images/svg/logo.svg', height: 50.h),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Text(S.of(context).login, style: AppTextStyle.font24Medium),
            SizedBox(height: mediaQuery.size.height * 0.06),

            //login form
            const LoginForm(),
            SizedBox(height: mediaQuery.size.height * 0.06),

            // Log In Button
            CustomElevatedButton(onPressed: () {}, text: loc.login),

            SizedBox(height: mediaQuery.size.height * 0.038),

            RichText(
              text: TextSpan(
                text: 'don\'t have an account?',
                style: AppTextStyle.font16Medium,
                children: [
                  TextSpan(
                    text: '',

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
    );
  }
}
