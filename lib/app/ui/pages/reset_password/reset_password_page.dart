// ignore_for_file: use_build_context_synchronously

import 'package:finance_app/app/domain/response/reset_password_response.dart';
import 'package:finance_app/app/ui/global_widgets/custom_input_flied.dart';
import 'package:finance_app/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:finance_app/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:finance_app/app/ui/pages/reset_password/controller/reset_password_provider.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:finance_app/app/utils/email_validator.dart';
import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderListener(
      provider: resetPasswordProvider,
      builder: (_, controller) {
        return Scaffold(
          appBar: AppBar(),
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Container(
              color: AppColorsTheme.white,
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomInputFile(
                        onChanged: controller.onEmailChanged,
                        label: texts.login.email,
                        inputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(
                        height: 8.0,
                      ),
                      MaterialButton(
                        onPressed: () => _submit(context),
                        color: AppColorsTheme.kPink,
                        minWidth: double.infinity,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                        ),
                        child: Text(
                          texts.login.send,
                          style: TextStyle(color: AppColorsTheme.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

void _submit(BuildContext context) async {
  final controller = resetPasswordProvider.read;
  if (isValidEmail(controller.email)) {
    ProgressDialog.show(context);
    final respone = await controller.submit();
    router.pop();
    if (respone == ResetPasswordResponse.ok) {
      Dialogs.alert(
        context,
        title: texts.login.good,
        content: texts.login.emailSent,
      );
    } else {
      String errorMessage = '';
      switch (respone) {
        case ResetPasswordResponse.networkRequestFailed:
          errorMessage = texts.login.networkRequestFailed;
          break;
        case ResetPasswordResponse.userDisabled:
          errorMessage = texts.login.userDisabled;
          break;
        case ResetPasswordResponse.userNotFound:
          errorMessage = texts.login.userNotFound;
          break;
        case ResetPasswordResponse.invalidEmail:
          errorMessage = texts.login.invalidEmail;
          break;
        case ResetPasswordResponse.internalError:
          errorMessage = texts.login.internalError;
          break;
        case ResetPasswordResponse.tooManyRequest:
          errorMessage = texts.login.tooManyRequest;
          break;
        case ResetPasswordResponse.unknown:
          errorMessage = texts.login.unknwonError;
          break;
        default:
          errorMessage = texts.login.unknwonError;
          break;
      }
      Dialogs.alert(
        context,
        title: texts.login.error,
        content: errorMessage,
      );
    }
  } else {
    Dialogs.alert(
      context,
      title: texts.login.error,
      content: texts.login.invalidEmail,
    );
  }
}
