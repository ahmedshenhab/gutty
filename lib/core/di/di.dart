import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:gutty/core/network/remote/interceptor/app_interceptor.dart';
import 'package:gutty/core/network/remote/interceptor/logger_interceptor.dart';
import 'package:gutty/module/auth/login/data/repo/login_repo.dart';
import 'package:gutty/module/auth/register/data/register_repo.dart';
import '../network/remote/dio_helper.dart';

final GetIt getIt = GetIt.instance;

  void setupGetIt() {
  getIt.registerLazySingleton<Dio>(() => DioHelper.init);
  getIt.registerLazySingleton<AppInterceptor>(() => AppInterceptor());
  getIt.registerLazySingleton<LoggerInterceptor>(() => LoggerInterceptor());

  // login

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(dio: getIt<Dio>()));

  
   // register

  getIt.registerLazySingleton< RegisterRepo>(() => RegisterRepo(dio: getIt<Dio>()));

  

}


// String get getIntialRoute {
//   final token = CachHelper.getData(key: AppConstant.tokenKey);
//   if (token != null && token.isNotEmpty) {
//     return MealLayoutScreen.homeScreen;
//   } else {
//     return MealLoginScreen.loginScreen;
//   }
// }
