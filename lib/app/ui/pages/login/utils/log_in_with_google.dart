import 'package:finance_app/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:finance_app/app/ui/pages/login/controller/login_provider.dart';
import 'package:finance_app/app/ui/pages/login/utils/handle_login_response.dart';
import 'package:flutter/widgets.dart';

Future<void> logInWithGoogle(BuildContext context) async {
  ProgressDialog.show(context);
  final controller = loginProvider.read;
  final response = await controller.signInWithGoogle();
  // ignore: use_build_context_synchronously
  handleLoginResponse(
    context,
    response,
  );
}
