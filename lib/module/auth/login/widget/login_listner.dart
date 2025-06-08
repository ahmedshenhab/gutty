import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/reusable/custom_alert_dialog_message.dart';
import '../../../layout_screen/layout_screen.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';

class LoginListner extends StatelessWidget {
  const LoginListner({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, MealLoginStates>(
      listenWhen:
          (previous, current) =>
              current is MealLoginSuccessState ||
              current is MealLoginErrorState ||
              current is MealLoginLoadingState,
      listener: (context, state) async {
        if (state is MealLoginSuccessState) {
          Navigator.pushNamedAndRemoveUntil(context, LayoutScreen.routeName, (_) => false);
        }

        if (state is MealLoginErrorState) {
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
