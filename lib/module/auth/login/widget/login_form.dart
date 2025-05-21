import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/reusable.dart';
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

    return Form(
      autovalidateMode: AutovalidateMode.disabled,
      key: cubit.formState,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildCustomField(
              context,
              controller: cubit.emailController,
              labelText: '',

              validator: (value) {
              
              },
              type: TextInputType.name,
            ),
            SizedBox(height: mediaQuery.size.height * 0.03),

            // password
            buildCustomField(
              labelText: '',
              context,
              controller: cubit.passwordController,
              validator: (value) {
              
              },
              isHiddenPassword: isPasswordVisible,
              type: TextInputType.visiblePassword,
              sufixIconBotton: InkWell(
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

            TextButton(
              style: Theme.of(context).textButtonTheme.style!.copyWith(
                padding: WidgetStateProperty.all(EdgeInsets.zero),
                alignment: Alignment.center,
                minimumSize: WidgetStateProperty.all(Size.zero),

                // shadowColor: WidgetStateProperty.all(Colors.transparent),
                overlayColor: WidgetStateProperty.all(Colors.transparent),
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
              ),
              onPressed: () {
               cubit.clearform();

               
              },

              child: Text(
              '',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  decoration: TextDecoration.underline,
                  decorationThickness: 1.3.w,
                 

                  fontFamily: 'Poppins',
                  fontSize: 13.8.sp,
                  fontWeight: FontWeight.w100,
                 
                ),
              ),
            ),
            const LoginListner(),
          ],
        ),
      ),
    );
  }
}
