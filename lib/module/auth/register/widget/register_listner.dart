import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutty/core/reusable/custom_alert_dialog_message.dart';
import 'package:gutty/module/auth/register/cubit/cubit.dart';
import 'package:gutty/module/auth/register/cubit/states.dart';
import 'package:gutty/module/layout_screen/layout_screen.dart';

class RegisterListner extends StatelessWidget {
  const RegisterListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, MealRegisterStates>(
      listener: (context, state) {
        if (state is MealRegisterSuccessState) {
          Navigator.pushNamed(context, LayoutScreen.routeName);
        }

        if (state is MealRegisterErrorState) {
          showCustomAlertDialog(
            context: context,
            title: "Error",
            message: state.error,
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
