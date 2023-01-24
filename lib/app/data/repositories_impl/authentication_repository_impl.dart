import 'package:finance_app/app/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepository {
  @override
  Future<String?> get accesToken async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    return 'null';
  }
}
