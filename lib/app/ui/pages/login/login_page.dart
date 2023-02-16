import 'package:finance_app/app/ui/global_widgets/custom_input_flied.dart';
import 'package:finance_app/app/ui/global_widgets/social_icon_button.dart';
import 'package:finance_app/app/ui/pages/login/controller/login_controller.dart';
import 'package:finance_app/app/ui/pages/login/controller/login_provider.dart';
import 'package:finance_app/app/ui/pages/login/utils/log_in_with_google.dart';
import 'package:finance_app/app/ui/pages/login/utils/send_login_form.dart';
import 'package:finance_app/app/ui/routes/routes.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:finance_app/app/utils/app_constants.dart';
import 'package:finance_app/app/utils/email_validator.dart';
import 'package:finance_app/app/utils/social_icons_icons.dart';
import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:google_fonts/google_fonts.dart';

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
              child: Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          AppConstants.nameOfApp,
                          style: GoogleFonts.ubuntu(
                            color: AppColorsTheme.kPink,
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                  color: AppColorsTheme.grey,
                                  blurRadius: 16,
                                  offset: const Offset(0, 8.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: ListView(
                        padding: const EdgeInsets.all(8.0),
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
                                onPressed: () {},
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
