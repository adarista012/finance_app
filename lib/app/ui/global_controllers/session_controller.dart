import 'package:finance_app/app/domain/repositories/authentication_repository.dart';
import 'package:finance_app/app/ui/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

class SessionController extends SimpleNotifier {
  User? _user;
  User? get user => _user;

  final _authenticationRepository = Get.find<AuthenticationRepository>();

  void setUser(User user) {
    _user = user;
    notify();
  }

  Future<void> signOut() async {
    await _authenticationRepository.singOut();
    _user = null;
    router.pushNamedAndRemoveUntil(Routes.LOGIN);
  }
}

final sessionProvider = SimpleProvider(
  (_) => SessionController(),
  autoDispose: false,
);
