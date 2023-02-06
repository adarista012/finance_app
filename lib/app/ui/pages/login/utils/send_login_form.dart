import 'package:finance_app/app/domain/response/sign_in_response.dart';
import 'package:finance_app/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:finance_app/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:finance_app/app/ui/pages/login/controller/login_provider.dart';
import 'package:finance_app/app/ui/routes/routes.dart';
import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    String errorMessage = "";
    switch (response.error) {
      case SignInError.networkRequestFailed:
        errorMessage = texts.login.networkRequestFailed;
        break;
      case SignInError.userDisabled:
        errorMessage = texts.login.userDisabled;
        break;
      case SignInError.userNotFound:
        errorMessage = texts.login.userNotFound;
        break;
      case SignInError.wrongPassword:
        errorMessage = texts.login.wrongPassword;
        break;
      case SignInError.tooManyRequest:
        errorMessage = texts.login.tooManyRequest;
        break;
      default:
        errorMessage = texts.login.unknwonError;
        break;
    }
    router.pop();
    if (response.error != null) {
      // ignore: use_build_context_synchronously
      Dialogs.alert(
        context,
        title: texts.login.error,
        content: errorMessage,
      );
    } else {
      router.pushReplacementNamed(Routes.HOME);
    }
  }
}
