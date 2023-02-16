import 'package:finance_app/app/domain/response/sign_in_response.dart';
import 'package:finance_app/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:finance_app/app/ui/routes/routes.dart';
import 'package:finance_app/app/utils/app_constants.dart';
import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_meedu/ui.dart';

void handleLoginResponse(BuildContext context, SignInResponse response) {
  String errorMessage = AppConstants.empty;
  if (response.error == SignInError.cancelled) {
    router.pop();
  } else {
    if (response.error != null) {
      switch (response.error) {
        case SignInError.accountExistsWithDifferentCredential:
          errorMessage = texts.login.accountExistsWithDifferentCredential;
          break;
        case SignInError.invalidCredential:
          errorMessage = texts.login.invalidCredential;
          break;
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
      Dialogs.alert(
        context,
        title: texts.login.error,
        content: errorMessage,
      );
    } else {
      router.pushNamedAndRemoveUntil(
        Routes.HOME,
      );
    }
  }
}
