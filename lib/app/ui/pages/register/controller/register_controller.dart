import 'package:flutter/material.dart';
import 'package:flutter_meedu/meedu.dart';

import 'package:finance_app/app/domain/inputs/sign_up.dart';
import 'package:finance_app/app/domain/repositories/sign_up_repository.dart';
import 'package:finance_app/app/domain/response/sign_up_response.dart';
import 'package:finance_app/app/ui/global_controllers/session_controller.dart';
import 'package:finance_app/app/ui/pages/register/controller/register_state.dart';

class RegisterController extends StateNotifier<RegisterState> {
  final SessionController _sessionController;
  RegisterController(
    this._sessionController,
  ) : super(RegisterState.initialState);

  final _signUpRepository = Get.find<SingUpRepository>();
  final GlobalKey<FormState> _formKey = GlobalKey();
  GlobalKey<FormState> get formKey => _formKey;
  Future<SignUpResponse> submit() async {
    final response = await _signUpRepository.register(
      SignUpData(
        email: state.email,
        password: state.password,
        name: state.name,
      ),
    );
    if (response.error == null) {
      _sessionController.setUser(response.user!);
    }
    return response;
  }

  void onNameChanged(String text) {
    state = state.copyWith(name: text);
  }

  void onEmailChanged(String text) {
    state = state.copyWith(email: text);
  }

  void onPasswordChanged(String text) {
    state = state.copyWith(password: text);
  }

  void onVpasswordChanged(String text) {
    state = state.copyWith(vPassword: text);
  }
}
