import 'package:finance_app/app/ui/pages/splash/controller/splash_controller.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:finance_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'controller/splash_provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
      provider: splashProvider,
      onChange: (_, notifier) {
        final routeName = notifier.routeName;
        if (routeName != null) {
          router.pushReplacementNamed(
            routeName,
            transition: Transition.downToUp,
            transitionDuration: const Duration(milliseconds: 1240),
          );
        }
      },
      builder: (_, __) {
        return Scaffold(
          backgroundColor: AppColorsTheme.kPink,
          body: Center(
            child: Text(
              AppConstants.nameOfApp,
              style: GoogleFonts.ubuntu(
                color: AppColorsTheme.white,
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
