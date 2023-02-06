import 'package:finance_app/app/domain/inputs/sign_up.dart';
import 'package:finance_app/app/domain/response/sign_up_response.dart';

abstract class SingUpRepository {
  Future<SignUpResponse> register(SignUpData data);
}
