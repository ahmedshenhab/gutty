import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gutty/core/di/setup.dart';
import 'package:gutty/core/routing/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gutty/core/ui/theme/app_light_theme.dart';
import 'package:gutty/generated/l10n.dart';
import 'package:gutty/module/detail_screen/detail_screen.dart';
import 'package:gutty/module/layout_screen/layout_screen.dart';

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
      builder:
          (_, child) => MaterialApp(
            locale: const Locale('en'),
            debugShowCheckedModeBanner: false,
            theme: AppLightTheme.lighTheme,
            onGenerateRoute: AppRouter.onGenerateRoute,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            initialRoute: LayoutScreen.routeName,
          ),
    );
  }
}
