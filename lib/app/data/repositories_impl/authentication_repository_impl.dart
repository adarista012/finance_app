import 'dart:async';

import 'package:finance_app/app/domain/repositories/authentication_repository.dart';
import 'package:finance_app/app/domain/response/reset_password_response.dart';
import 'package:finance_app/app/domain/response/sign_in_response.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final FirebaseAuth _auth;
  User? _user;

  final Completer<void> _completer = Completer();
  AuthenticationRepositoryImpl(this._auth) {
    _init();
  }

  @override
  Future<User?> get user async {
    await _completer.future;
    return _user;
  }

  void _init() {
    _auth.authStateChanges().listen((User? user) {
      if (!_completer.isCompleted) {
        _completer.complete();
      }
      _user = user;
      // if (user == null) {
      //   _user = user;
      //   print('User is currently signed out!');
      // } else {
      //   _user = user;
      //   print('User is signed in!');
      // }
    });
  }

  @override
  Future<void> singOut() {
    return _auth.signOut();
  }

  @override
  Future<SignInResponse> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;
      return SignInResponse(null, user);
    } on FirebaseAuthException catch (e) {
      return SignInResponse(
        stringToSignInError(e.code),
        null,
      );
    }
  }

  @override
  Future<ResetPasswordResponse> sendResetPasswordLink(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return ResetPasswordResponse.ok;
    } on FirebaseAuthException catch (e) {
      return stringToResetPassword(e.code);
    }
  }
}
