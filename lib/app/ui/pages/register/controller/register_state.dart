import 'package:finance_app/app/utils/app_constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  factory RegisterState({
    @Default(AppConstants.empty) String email,
    @Default(AppConstants.empty) String password,
    @Default(AppConstants.empty) String vPassword,
    @Default(AppConstants.empty) String name,
    @Default(false) bool termsOk,
  }) = _RegisterState;

  static RegisterState get initialState => RegisterState();
}
