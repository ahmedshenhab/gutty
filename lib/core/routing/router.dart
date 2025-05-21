import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutty/core/di/setup.dart';
import 'package:gutty/module/auth/login/cubit/cubit.dart';
import 'package:gutty/module/auth/login/data/repo/login_repo.dart';
import 'package:gutty/module/auth/login/meal_login_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      // login
      case LoginScreen.loginScreen:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => LoginCubit(loginRepo: getIt<LoginRepo>()),
                child: LoginScreen(),
              ),
        );

      default:
        return null;
    }
  }
}
