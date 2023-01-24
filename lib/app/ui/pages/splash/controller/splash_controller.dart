import 'package:finance_app/app/domain/repositories/authentication_repository.dart';
import 'package:finance_app/app/ui/routes/routes.dart';
import 'package:flutter_meedu/meedu.dart';

class SplashController extends SimpleNotifier {
  SplashController() {
    _init();
  }

  final AuthenticationRepository _auth = Get.find();
  
  String? _routeName;
  String? get routeName => _routeName;

  Future<void> _init() async {
    if (await _auth.accesToken != null) {
      _routeName = Routes.HOME;
    }
    notify();
  }
}
