import 'package:finance_app/app/ui/pages/settings/settings_page.dart';

import '../pages/reset_password/reset_password_page.dart';
import '../pages/register/register_page.dart';
import '../pages/login/login_page.dart';
import '../pages/splash/splash_page.dart';
import '../pages/detail/detail_page.dart';
import 'package:flutter/widgets.dart' show BuildContext, Widget;
import 'routes.dart';
import '../pages/home/home_page.dart';

/// WARNING: generated code don't modify directly
Map<String, Widget Function(BuildContext)> get appRoutes {
  return {
    Routes.HOME: (_) => const HomePage(),
    Routes.DETAIL: (_) => const DetailPage(),
    Routes.SPLASH: (_) => const SplashPage(),
    Routes.LOGIN: (_) => const LoginPage(),
    Routes.REGISTER: (_) => const RegisterPage(),
    Routes.RESET_PASSWORD: (_) => const ResetPasswordPage(),
    Routes.SETTINGS: (_) => const SettingsPage(),
  };
}
