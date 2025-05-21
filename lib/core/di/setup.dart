import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:gutty/core/network/remote/interceptor/app_interceptor.dart';
import 'package:gutty/core/network/remote/interceptor/logger_interceptor.dart';
import 'package:gutty/core/services/shared_prefrence/cach_helper.dart';
import 'package:gutty/module/auth/login/data/repo/login_repo.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../network/remote/dio_helper.dart';
import '../observer/observer.dart';

final GetIt getIt = GetIt.instance;

  void setupGetIt() {
  getIt.registerLazySingleton<Dio>(() => DioHelper.init);
  getIt.registerLazySingleton<AppInterceptor>(() => AppInterceptor());
  getIt.registerLazySingleton<LoggerInterceptor>(() => LoggerInterceptor());

  // login

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(dio: getIt<Dio>()));

  

}

Future<void> setupApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  // HydratedBloc.storage = await HydratedStorage.build(
  //   storageDirectory: HydratedStorageDirectory(
  //     (await getTemporaryDirectory()).path,
  //   ),
  // );
  

  await Future.wait([
    CachHelper.init,
    ScreenUtil.ensureScreenSize(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
     
    ]),
     

    
  ]);

  setupGetIt();
}

// String get getIntialRoute {
//   final token = CachHelper.getData(key: AppConstant.tokenKey);
//   if (token != null && token.isNotEmpty) {
//     return MealLayoutScreen.homeScreen;
//   } else {
//     return MealLoginScreen.loginScreen;
//   }
// }
