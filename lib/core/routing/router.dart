import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../di/di.dart';
import '../../module/auth/login/cubit/cubit.dart';
import '../../module/auth/login/data/repo/login_repo.dart';
import '../../module/auth/login/meal_login_screen.dart';
import '../../module/auth/register/cubit/cubit.dart';
import '../../module/auth/register/data/register_repo.dart';
import '../../module/auth/register/register_screen.dart';
import '../../module/detail_screen/detail_screen.dart';
import '../../module/layout_screen/layout_screen.dart';

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
                create:
                    (context) =>
                        RegisterCubit(registerRepo: getIt<RegisterRepo>()),
                child: const RegisterScreen(),
              ),
        );
      case DetailScreen.routeName:
        final map = setting.arguments as Map<String,String>;

        return MaterialPageRoute(
          builder:
              (context) => BlocProvider(
                create: (context) => LoginCubit(loginRepo: getIt<LoginRepo>()),
                child:  DetailScreen(map:map),
              ),
        );
      case LayoutScreen.routeName:
        return MaterialPageRoute(builder: (context) =>  const LayoutScreen( ));

      default:
        return null;
    }
  }
}
