import 'package:finance_app/app/ui/global_widgets/custom_input_flied.dart';
import 'package:finance_app/app/ui/pages/register/controller/register_controller.dart';
import 'package:finance_app/app/ui/pages/register/controller/register_provider.dart';
import 'package:finance_app/app/ui/pages/register/utils/send_register.dart';
import 'package:finance_app/app/ui/routes/routes.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:finance_app/app/utils/email_validator.dart';
import 'package:finance_app/app/utils/name_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:finance_app/generated/translations.g.dart';

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
              child: Form(
                key: controller.formKey,
                child: Column(
                  // padding: const EdgeInsets.all(8.0),
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          color: AppColorsTheme.white,
                        )),
                    Expanded(
                      flex: 5,
                      child: ListView(
                        padding: const EdgeInsets.all(8.0),
                        children: [
                          CustomInputFile(
                            onChanged: controller.onNameChanged,
                            label: texts.login.name,
                            inputType: TextInputType.emailAddress,
                            validator: (text) {
                              return isValidName(text!)
                                  ? null
                                  : texts.login.invalidName;
                            },
                          ),
                          CustomInputFile(
                            onChanged: controller.onEmailChanged,
                            label: texts.login.email,
                            inputType: TextInputType.emailAddress,
                            validator: (text) {
                              return isValidEmail(text!)
                                  ? null
                                  : texts.login.invalidEmail;
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
                              ref.watch(
                                  registerProvider.select((_) => _.password));
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16.0))),
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
                              Text('${texts.login.alreadyHaveAnAccount}?'),
                              TextButton(
                                onPressed: () {
                                  router.pushNamedAndRemoveUntil(Routes.LOGIN);
                                },
                                child: Text(texts.login.signIn),
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
