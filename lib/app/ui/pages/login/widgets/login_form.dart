import 'package:finance_app/app/ui/pages/login/controller/login_controller.dart';
import 'package:finance_app/app/ui/pages/login/utils/log_in_with_facebook.dart';
import 'package:finance_app/app/ui/routes/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

import '../../../../../generated/translations.g.dart';
import '../../../../utils/app_colors_theme.dart';
import '../../../../utils/email_validator.dart';
import '../../../../utils/social_icons_icons.dart';
import '../../../global_widgets/custom_input_flied.dart';
import '../../../global_widgets/social_icon_button.dart';
import '../utils/log_in_with_google.dart';
import '../utils/send_login_form.dart';

class LoginForm extends StatelessWidget {
  final LoginController controller;
  const LoginForm({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 24.0,
            ),
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
                texts.login.logIn,
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
                Text(
                  texts.login.orSignInWith,
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialIconButton(
                  onPressed: () => logInWithFacebook(context),
                  color: Colors.blueAccent,
                  icon: Icon(
                    SocialIcons.facebook,
                    color: AppColorsTheme.white,
                  ),
                ),
                SocialIconButton(
                  onPressed: () => logInWithGoogle(context),
                  color: Colors.redAccent,
                  icon: Icon(
                    SocialIcons.google,
                    color: AppColorsTheme.white,
                  ),
                ),
                if (defaultTargetPlatform == TargetPlatform.iOS)
                  SocialIconButton(
                    onPressed: () {},
                    color: Colors.black,
                    icon: Icon(
                      SocialIcons.apple,
                      color: AppColorsTheme.white,
                    ),
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${texts.login.dontHaveAnAccount}?'),
                TextButton(
                  onPressed: () {
                    router.pushNamedAndRemoveUntil(
                      Routes.REGISTER,
                      transition: Transition.upToDown,
                    );
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
    );
  }
}
