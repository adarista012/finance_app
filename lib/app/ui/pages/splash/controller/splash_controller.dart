import 'package:flutter_meedu/meedu.dart';

import 'package:finance_app/app/domain/repositories/authentication_repository.dart';
import 'package:finance_app/app/ui/global_controllers/session_controller.dart';
import 'package:finance_app/app/ui/routes/routes.dart';

class SplashController extends SimpleNotifier {
  final SessionController _sessionController;
  SplashController(
    this._sessionController,
  ) {
    _init();
  }

  final AuthenticationRepository _auth = Get.find();

  String? _routeName;
  String? get routeName => _routeName;

  Future<void> _init() async {
    final user = await _auth.user;
    if (user != null) {
      _routeName = Routes.HOME;
      _sessionController.setUser(user);
    } else {
      _routeName = Routes.LOGIN;
    }
    notify();
  }
}
