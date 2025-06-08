import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/lang/localization_service.dart';
import 'core/routing/router.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/setup.dart';
import 'core/ui/theme/app_light_theme.dart';
import 'generated/l10n.dart';
import 'module/layout_screen/layout_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      designSize: const Size(390, 812),
      builder:
          (_, __) => MaterialApp(
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
            locale: const Locale('en'),

            builder: (context, child) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                LocalizationService.init(context);
              });

              return child!;
            },
            initialRoute: LayoutScreen.routeName,
          ),
    );
  }
}
