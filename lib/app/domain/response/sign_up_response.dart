import 'package:finance_app/app/utils/app_constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpResponse {
  final SignUpError? error;
  final User? user;

  SignUpResponse(this.error, this.user);
}

parseStringToSignUpError(String text) {
  switch (text) {
    case AppConstants.networkRequestFailed:
      return SignUpError.networkRequestFailed;
    case AppConstants.emailAlreadyInUse:
      return SignUpError.emailAlreadyInUse;
    case AppConstants.weakPassword:
      return SignUpError.weakPassword;
    case AppConstants.unknown:
      return SignUpError.unknown;
  }
}

enum SignUpError {
  emailAlreadyInUse,
  weakPassword,
  networkRequestFailed,
  unknown,
}
