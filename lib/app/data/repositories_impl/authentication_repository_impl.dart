import 'dart:async';
import 'package:finance_app/app/domain/repositories/authentication_repository.dart';
import 'package:finance_app/app/domain/response/reset_password_response.dart';
import 'package:finance_app/app/domain/response/sign_in_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;
  User? _user;

  final Completer<void> _completer = Completer();
  AuthenticationRepositoryImpl(
      {required FirebaseAuth firebaseAuth,
      required GoogleSignIn googleSignIn,
      required FacebookAuth facebookAuth})
      : _auth = firebaseAuth,
        _googleSignIn = googleSignIn,
        _facebookAuth = facebookAuth {
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
    });
  }

  @override
  Future<void> singOut() async {
    final data = _user?.providerData ?? [];
    String providerId = 'firebase';
    for (final provider in data) {
      //password
      //phone
      //google.com
      //facebook.com
      // github.com
      // apple.com
      if (provider.providerId != 'firebase') {
        providerId = provider.providerId;
        break;
      }
    }
    if (providerId == 'google.com') {
      await _googleSignIn.signOut();
    } else if (providerId == 'facebook.com') {
      await _facebookAuth.logOut();
    }
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
      if (!user!.emailVerified) {
        await user.sendEmailVerification();
      }
      return SignInResponse(
        null,
        user,
      );
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

  @override
  Future<SignInResponse> logInWithGoogle() async {
    try {
      final account = await _googleSignIn.signIn();
      if (account == null) {
        return SignInResponse(
          SignInError.cancelled,
          null,
        );
      }
      final googleAuth = await account.authentication;
      final oAuthCredential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );
      final userCredential = await _auth.signInWithCredential(
        oAuthCredential,
      );
      return SignInResponse(
        null,
        userCredential.user,
      );
    } on FirebaseAuthException catch (e) {
      return SignInResponse(
        stringToSignInError(e.code),
        null,
      );
    }
  }

  @override
  Future<SignInResponse> logInWithFacebook() async {
    try {
      final result = await _facebookAuth.login();

      if (result.status == LoginStatus.success) {
        final oAuthCredential =
            FacebookAuthProvider.credential(result.accessToken!.token);
        final userCredential = await _auth.signInWithCredential(
          oAuthCredential,
        );
        final user = userCredential.user;
        if (!user!.emailVerified && user.email != null) {
          user.sendEmailVerification();
        }
        return SignInResponse(
          null,
          user,
        );
      } else if (result.status == LoginStatus.cancelled) {
        return SignInResponse(
          SignInError.cancelled,
          null,
        );
      }
      return SignInResponse(
        SignInError.unknown,
        null,
      );
    } on FirebaseAuthException catch (e) {
      return SignInResponse(
        stringToSignInError(e.code),
        null,
      );
    }
  }
}
