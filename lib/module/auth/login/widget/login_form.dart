import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/generated/l10n.dart';
import 'package:gutty/reusable/custom_text_form_field.dart';
import '../cubit/cubit.dart';
import 'login_listner.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final cubit = LoginCubit.get(context);
    final localization = S.of(context);

    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: cubit.formState,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            CustomTextFormField(
              hintText: localization.email,
              controller: cubit.emailController,

              type: TextInputType.name,
              validator: (value) {
                return null;
              },
            ),
            SizedBox(height: mediaQuery.size.height * 0.03),

            // password
            CustomTextFormField(
              hintText: localization.password,
              controller: cubit.passwordController,
              validator: (value) {
                return null;
              },
              isHiddenPassword: isPasswordVisible,
              type: TextInputType.visiblePassword,

              suffixIconButton: InkWell(
                onTap: () {
                  isPasswordVisible = !isPasswordVisible;
                  setState(() {});
                },
                child: Icon(
                  isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                  size: 20.w,
                ),
              ),
            ),

            SizedBox(height: mediaQuery.size.height * 0.02),

            const LoginListner(),
          ],
        ),
      ),
    );
  }
}
