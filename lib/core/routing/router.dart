import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gutty/core/di/di.dart';
import 'package:gutty/module/auth/login/cubit/cubit.dart';
import 'package:gutty/module/auth/login/data/repo/login_repo.dart';
import 'package:gutty/module/auth/login/meal_login_screen.dart';
import 'package:gutty/module/auth/register/cubit/cubit.dart';
import 'package:gutty/module/auth/register/data/register_repo.dart';
import 'package:gutty/module/auth/register/register_screen.dart';
import 'package:gutty/module/detail_screen/detail_screen.dart';
import 'package:gutty/module/layout_screen/layout_screen.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      // login
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => LoginCubit(loginRepo: getIt<LoginRepo>()),
                child: const LoginScreen(),
              ),
        );
        // register
        case RegisterScreen.routeName:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => RegisterCubit(registerRepo: getIt<RegisterRepo>()),
                child: const RegisterScreen(),
              ),
        );
         case DetailScreen.routeName:
        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => LoginCubit(loginRepo: getIt<LoginRepo>()),
                child:  const DetailScreen(),
              ),
        );
        case LayoutScreen.routeName:
        return MaterialPageRoute(
          builder:
              (context) =>  const LayoutScreen(),
        );

      default:
        return null;
    }
  }
}
