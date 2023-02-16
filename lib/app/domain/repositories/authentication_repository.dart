import 'package:finance_app/app/domain/response/reset_password_response.dart';
import 'package:finance_app/app/domain/response/sign_in_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationRepository {
  Future<User?> get user;
  Future<void> singOut();

  Future<SignInResponse> signInWithEmailAndPassword(
    String email,
    String password,
  );
  Future<SignInResponse> signInWithGoogle();

  Future<ResetPasswordResponse> sendResetPasswordLink(String email);
}
