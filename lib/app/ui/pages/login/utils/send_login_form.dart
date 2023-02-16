import 'package:finance_app/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:finance_app/app/ui/pages/login/controller/login_provider.dart';
import 'package:finance_app/app/ui/pages/login/utils/handle_login_response.dart';
import 'package:flutter/material.dart';

Future<void> sendLoginForm(BuildContext context) async {
  final controller = loginProvider.read;
  final isValidForm = controller.formKey.currentState!.validate();
  if (isValidForm) {
    ProgressDialog.show(context);
    final response = await controller.signInWithEmailAndPassword();
    // ignore: use_build_context_synchronously
    handleLoginResponse(
      context,
      response,
    );
  }
}
