import 'package:finance_app/app/domain/repositories/account_repository.dart';
import 'package:finance_app/app/domain/repositories/authentication_repository.dart';
import 'package:finance_app/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:finance_app/app/ui/routes/routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

class SessionController extends SimpleNotifier {
  User? _user;
  User? get user => _user;

  final _authenticationRepository = Get.find<AuthenticationRepository>();
  final AccountRepository _account = Get.find();

  void setUser(User user) {
    _user = user;
    notify();
  }

  Future<User?> updateDisplayName(String value) async {
    final user = await _account.updateDisplayName(value);
    if (user != null) {
      _user = user;
      notify();
    }
    return user;
  }

  Future<void> signOut() async {
    await _authenticationRepository.singOut();
    _user = null;
    router.pushNamedAndRemoveUntil(
      Routes.LOGIN,
      transition: Transition.fadeIn,
    );
  }
}

final sessionProvider = SimpleProvider(
  (_) => SessionController(),
  autoDispose: false,
);
