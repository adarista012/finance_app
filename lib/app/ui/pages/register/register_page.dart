import 'package:finance_app/app/ui/global_widgets/name_of_app.dart';
import 'package:finance_app/app/ui/pages/register/controller/register_controller.dart';
import 'package:finance_app/app/ui/pages/register/controller/register_provider.dart';
import 'package:finance_app/app/ui/pages/register/widgets/register_form.dart';
import 'package:finance_app/app/ui/pages/register/widgets/tween_animation_list.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener<RegisterController>(
      provider: registerProvider,
      builder: (_, controller) {
        return Scaffold(
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
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
                      RegisterForm(
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
