import 'package:finance_app/app/domain/response/sign_up_response.dart';
import 'package:finance_app/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:finance_app/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:finance_app/app/ui/pages/register/controller/register_provider.dart';
import 'package:finance_app/app/ui/routes/routes.dart';
import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

Future<void> sendRegisterForm(BuildContext context) async {
  final controller = registerProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();

  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.submit();
    router.pop();
    late String content;
    if (response.error != null) {
      switch (response.error!) {
        case SignUpError.accountExistsWithDifferentCredential:
          content = texts.login.accountExistsWithDifferentCredential;
          break;
        case SignUpError.emailAlreadyInUse:
          content = texts.login.emailAlreadyInUse;
          break;
        case SignUpError.invalidCredential:
          content = texts.login.invalidCredential;
          break;
        case SignUpError.networkRequestFailed:
          content = texts.login.networkRequestFailed;
          break;
        case SignUpError.weakPassword:
          content = texts.login.weakPassword;
          break;
        case SignUpError.unknown:
          content = texts.login.unknwonError;
          break;
        default:
          content = texts.login.unknwonError;
          break;
      }
      // ignore: use_build_context_synchronously
      Dialogs.alert(
        context,
        title: texts.login.error,
        content: content,
      );
    } else {
      router.pushNamedAndRemoveUntil(
        Routes.HOME,
      );
    }
  } else {
    Dialogs.alert(
      context,
      title: texts.login.error,
      content: texts.login.invalidFields,
    );
  }
}
