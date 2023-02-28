import 'package:finance_app/app/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpResponse {
  final SignUpError? error;
  final User? user;

  SignUpResponse(this.error, this.user);
}

enum SignUpError {
  accountExistsWithDifferentCredential,
  emailAlreadyInUse,
  invalidCredential,
  weakPassword,
  networkRequestFailed,
  unknown,
}

SignUpError parseStringToSignUpError(String text) {
  switch (text) {
    case AppConstants.accountExistsWithDifferentCredential:
      return SignUpError.accountExistsWithDifferentCredential;
    case AppConstants.invalidCredential:
      return SignUpError.invalidCredential;
    case AppConstants.networkRequestFailed:
      return SignUpError.networkRequestFailed;
    case AppConstants.emailAlreadyInUse:
      return SignUpError.emailAlreadyInUse;
    case AppConstants.weakPassword:
      return SignUpError.weakPassword;
    case AppConstants.unknown:
      return SignUpError.unknown;
    default:
      return SignUpError.unknown;
  }
}
