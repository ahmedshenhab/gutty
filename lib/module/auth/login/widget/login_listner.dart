import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutty/core/services/shared_prefrence/cach_helper.dart';
import '../../../../core/app_constant.dart';
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
        if (state is MealLoginLoadingState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder:
                (context) => const Center(
                  child: CircularProgressIndicator(
                  ),
                ),
          );
        }

        if (state is MealLoginSuccessState) {
          final rootNavigator = Navigator.of(context, rootNavigator: true);
          if (rootNavigator.canPop()) {
            rootNavigator.pop();
          }
          if (state.loginModelResponse.token == null ||
              state.loginModelResponse.token!.isEmpty) {
            showDialog(
              context: context,
              builder:
                  (context) => AlertDialog(
                    title: const Icon(
                      Icons.check_circle_outline,
                      color: Colors.red,
                    ),
                    content: Text(
                   '',
                      style: Theme.of(
                        context,
                      ).textTheme.bodyMedium!.copyWith(fontSize: 14),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                         '',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
            );
          } else {
            Future.wait([
              CachHelper.setData(
                key: AppConstant.tokenKey,
                value: state.loginModelResponse.token,
              ),
              CachHelper.setData(
                key: AppConstant.userName,
                value: state.loginModelResponse.user!.fullName ?? 'defualt',
              ),
              CachHelper.setData(
                key: AppConstant.email,
                value: state.loginModelResponse.user!.email ?? 'email',
              ),
            ]);

            // if (context.mounted) {
            //   Navigator.pushNamedAndRemoveUntil(
            //     context,

            //     MealLayoutScreen.homeScreen,

            //     (route) => false,
            //   );
            // }
          }
        }

        if (state is MealLoginErrorState) {
          if (context.mounted) {
            final rootNavigator = Navigator.of(context, rootNavigator: true);
            if (rootNavigator.canPop()) {
              rootNavigator.pop();
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Icon(Icons.error, color: Colors.red),
                      content: Text(
                        state.error!,
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium!.copyWith(fontSize: 14),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                          '',
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
              );
            }
          }
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
