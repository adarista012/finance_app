import 'package:finance_app/app/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInResponse {
  final SignInError? error;
  final User? user;

  SignInResponse(this.error, this.user);
}

enum SignInError {
  accountExistsWithDifferentCredential,
  invalidCredential,
  cancelled,
  networkRequestFailed,
  userDisabled,
  userNotFound,
  wrongPassword,
  tooManyRequest,
  unknown,
}

SignInError stringToSignInError(String code) {
  switch (code) {
    case AppConstants.accountExistsWithDifferentCredential:
      return SignInError.accountExistsWithDifferentCredential;
    case AppConstants.invalidCredential:
      return SignInError.invalidCredential;
    case AppConstants.networkRequestFailed:
      return SignInError.networkRequestFailed;
    case AppConstants.userDisabled:
      return SignInError.userDisabled;
    case AppConstants.userNotFound:
      return SignInError.userNotFound;
    case AppConstants.wrongPassword:
      return SignInError.wrongPassword;
    case AppConstants.tooManyRequest:
      return SignInError.tooManyRequest;
    default:
      return SignInError.unknown;
  }
}
