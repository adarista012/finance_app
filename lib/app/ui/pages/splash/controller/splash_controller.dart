import 'package:finance_app/app/ui/routes/routes.dart';
import 'package:flutter_meedu/meedu.dart';

class SplashController extends SimpleNotifier {
  SplashController() {
    _init();
  }

  String? _routeName;
  String? get routeName => _routeName;

  Future<void> _init() async {
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    _routeName = Routes.HOME;
    notify();
  }
}
