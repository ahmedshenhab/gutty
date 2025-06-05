import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/lang/localization_service.dart';
import 'package:gutty/core/routing/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gutty/core/setup.dart';
import 'package:gutty/core/ui/theme/app_light_theme.dart';
import 'package:gutty/generated/l10n.dart';
import 'package:gutty/module/auth/login/meal_login_screen.dart';

void main() async {
  await setupApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder:
          (_, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppLightTheme.lighTheme,
            onGenerateRoute: AppRouter.onGenerateRoute,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (context, child) {

               
               LocalizationService.init(context);

              return child!;
            },

            supportedLocales: S.delegate.supportedLocales,

            initialRoute: LoginScreen.routeName,
          ),
    );
  }
}
