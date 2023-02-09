import 'package:finance_app/app/ui/global_controllers/language_controllerr.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_meedu/ui.dart';
import 'ui/routes/app_routes.dart';
import 'ui/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      key: router.appKey,
      title: 'Finance App',
      navigatorKey: router.navigatorKey,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        router.observer,
      ],
      routes: appRoutes,
      initialRoute: Routes.SPLASH,
      theme: AppColorsTheme.kThemeLight,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: AppLocaleUtils.supportedLocales,
      locale: context.language,
      //  TranslationProvider.of(context).flutterLocale,
    );
  }
}
