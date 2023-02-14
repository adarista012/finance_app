import 'package:finance_app/app/domain/repositories/authentication_repository.dart';
import 'package:finance_app/app/domain/response/reset_password_response.dart';
import 'package:finance_app/app/utils/app_constants.dart';
import 'package:flutter_meedu/meedu.dart';

class ResetPasswordController extends SimpleNotifier {
  String _email = AppConstants.empty;
  String get email => _email;

  final _authenticationRepository = Get.find<AuthenticationRepository>();

  void onEmailChanged(String text) {
    _email = text.trim();
  }

  Future<ResetPasswordResponse> submit() {
    return _authenticationRepository.sendResetPasswordLink(email);
  }
}
