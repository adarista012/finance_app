import 'package:finance_app/app/ui/pages/splash/controller/splash_controller.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'controller/splash_provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<SplashController>(
      provider: splashProvider,
      onChange: (_, notifier) {
        final routeName = notifier.routeName;
        if(routeName != null){
          router.pushReplacementNamed(
            routeName, 
            transition: Transition.fadeIn, 
            transitionDuration: const Duration(seconds: 1),
          );
        }
      },
      builder: (_, __) {
        return Scaffold(
          body: Center(
            child: Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                color: AppColorsTheme.kPink
              ),
              child: Center(
                child: Text(
                  'SPASH', 
                  style: TextStyle(
                    color: AppColorsTheme.white,
                  ),
                ),
              ),
            )
          ),
        );
      },
    );
  }
}
