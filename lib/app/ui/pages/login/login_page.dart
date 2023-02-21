import 'package:finance_app/app/ui/global_widgets/name_of_app.dart';
import 'package:finance_app/app/ui/pages/login/controller/login_controller.dart';
import 'package:finance_app/app/ui/pages/login/controller/login_provider.dart';
import 'package:finance_app/app/ui/pages/login/widgets/login_form.dart';
import 'package:finance_app/app/ui/pages/register/widgets/tween_animation_list.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<LoginController>(
      provider: loginProvider,
      builder: (_, controller) {
        return Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: AppColorsTheme.white,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Stack(
                    children: listTweens,
                  ),
                  MediaQuery.of(context).viewInsets.bottom == 0
                      ? Positioned(
                          top: MediaQuery.of(context).size.height / 4,
                          child: const NameOfApp(),
                        )
                      : const SizedBox(),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LoginForm(
                        controller: controller,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
