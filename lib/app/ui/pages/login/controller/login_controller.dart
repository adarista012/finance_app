import 'package:finance_app/app/domain/repositories/authentication_repository.dart';
import 'package:finance_app/app/domain/response/sign_in_response.dart';
import 'package:finance_app/app/ui/global_controllers/session_controller.dart';
import 'package:finance_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';

class LoginController extends SimpleNotifier {
  final SessionController _sessionController;
  String _email = AppConstants.empty, _password = AppConstants.empty;
  final GlobalKey<FormState> _formKey = GlobalKey();

  LoginController(this._sessionController);
  GlobalKey<FormState> get formKey => _formKey;
  final _authRepository = Get.find<AuthenticationRepository>();

  void onEmailChanged(String text) {
    _email = text;
  }

  void onPasswordChanged(String text) {
    _password = text;
  }

  Future<SignInResponse> signInWithEmailAndPassword() async {
    final response = await _authRepository.signInWithEmailAndPassword(
      _email,
      _password,
    );
    if (response.error == null) {
      _sessionController.setUser(
        response.user!,
      );
    }
    return response;
  }

  Future<SignInResponse> signInWithGoogle() async {
    final response = await _authRepository.signInWithGoogle();
    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }

    return response;
  }
}
