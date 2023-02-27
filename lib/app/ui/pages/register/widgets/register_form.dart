import 'package:finance_app/app/ui/global_widgets/custom_input_flied.dart';
import 'package:finance_app/app/ui/global_widgets/social_icon_button.dart';
import 'package:finance_app/app/ui/pages/login/utils/log_in_with_facebook.dart';
import 'package:finance_app/app/ui/pages/login/utils/log_in_with_google.dart';
import 'package:finance_app/app/ui/pages/register/controller/register_controller.dart';
import 'package:finance_app/app/ui/pages/register/controller/register_provider.dart';
import 'package:finance_app/app/ui/pages/register/utils/send_register.dart';
import 'package:finance_app/app/ui/routes/routes.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:finance_app/app/utils/email_validator.dart';
import 'package:finance_app/app/utils/social_icons_icons.dart';
import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class RegisterForm extends StatelessWidget {
  final RegisterController controller;
  const RegisterForm({super.key, required this.controller});

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
            CustomInputFile(
              onChanged: controller.onEmailChanged,
              label: texts.login.email,
              inputType: TextInputType.emailAddress,
              validator: (text) {
                return isValidEmail(text!) ? null : texts.login.invalidEmail;
              },
            ),
            CustomInputFile(
              onChanged: controller.onPasswordChanged,
              label: texts.login.password,
              isPassword: true,
              validator: (text) {
                if (text!.trim().length >= 6) {
                  return null;
                }
                return texts.login.invalidPassword;
              },
            ),
            Consumer(
              builder: (_, ref, __) {
                ref.watch(registerProvider.select((_) => _.password));
                return CustomInputFile(
                  onChanged: controller.onVpasswordChanged,
                  label: texts.login.verificationPassword,
                  isPassword: true,
                  validator: (text) {
                    if (controller.state.password != text) {
                      return texts.login.passwordDontMatch;
                    }
                    if (text!.trim().length >= 6) {
                      return null;
                    }
                    return texts.login.invalidPassword;
                  },
                );
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            MaterialButton(
              onPressed: () => sendRegisterForm(context),
              color: AppColorsTheme.kPink,
              minWidth: double.infinity,
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16.0))),
              child: Text(
                texts.login.register,
                style: TextStyle(color: AppColorsTheme.white),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  texts.login.orSignUpWith,
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
                Text('${texts.login.alreadyHaveAnAccount}?'),
                TextButton(
                  onPressed: () {
                    router.pushNamedAndRemoveUntil(
                      Routes.LOGIN,
                      transition: Transition.downToUp,
                    );
                  },
                  child: Text(texts.login.signIn),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
