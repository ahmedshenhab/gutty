import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/reusable/custom_alert_dialog_message.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../../../layout_screen/layout_screen.dart';

class RegisterListner extends StatelessWidget {
  const RegisterListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterCubit, MealRegisterStates>(
      listener: (context, state) {
        if (state is MealRegisterSuccessState) {
          Navigator.pushNamedAndRemoveUntil(context, LayoutScreen.routeName, (_) => false);
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
