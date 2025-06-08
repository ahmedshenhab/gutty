import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'di/di.dart';
import 'observer/observer.dart';
import 'services/shared_prefrence/cach_helper.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

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
