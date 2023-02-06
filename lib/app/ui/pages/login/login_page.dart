import 'package:finance_app/app/ui/global_widgets/custom_input_flied.dart';
import 'package:finance_app/app/ui/pages/login/controller/login_controller.dart';
import 'package:finance_app/app/ui/pages/login/controller/login_provider.dart';
import 'package:finance_app/app/ui/pages/login/utils/send_login_form.dart';
import 'package:finance_app/app/ui/routes/routes.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:finance_app/app/utils/email_validator.dart';
import 'package:finance_app/generated/translations.g.dart';
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
          // appBar: AppBar(),
          body:
              // Center(
              //   child: MaterialButton(
              //     onPressed: () {
              //       router.pushNamed( Routes.REGISTER );
              //     },
              //     child: Text(texts.login.signUp),
              //   ),
              // ),
              GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              height: double.infinity,
              width: double.infinity,
              color: AppColorsTheme.white,
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: const Text(
                          'Finance App',
                          style: TextStyle(
                            color: AppColorsTheme.kPink,
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        color: AppColorsTheme.white,
                        child: ListView(
                          children: [
                            CustomInputFile(
                              label: texts.login.email,
                              onChanged: controller.onEmailChanged,
                              inputType: TextInputType.emailAddress,
                              validator: (text) {
                                if (isValidEmail(text!)) {
                                  return null;
                                } else {
                                  return texts.login.invalidEmail;
                                }
                              },
                            ),
                            CustomInputFile(
                              label: texts.login.password,
                              onChanged: controller.onPasswordChanged,
                              isPassword: true,
                              validator: (text) {
                                if (text!.trim().length >= 6) {
                                  return null;
                                } else {
                                  return texts.login.invalidPassword;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            MaterialButton(
                              onPressed: () => sendLoginForm(context),
                              color: AppColorsTheme.kPink,
                              minWidth: double.infinity,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              ),
                              child: Text(
                                texts.login.register,
                                style: TextStyle(color: AppColorsTheme.white),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                router.pushNamed(Routes.RESET_PASSWORD);
                              },
                              child: Text(
                                '${texts.login.forgotYourPassword}?',
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${texts.login.dontHaveAnAccount}?'),
                                TextButton(
                                  onPressed: () {
                                    router.pushNamedAndRemoveUntil(
                                        Routes.REGISTER);
                                  },
                                  child: Text(
                                    texts.login.signUp,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
