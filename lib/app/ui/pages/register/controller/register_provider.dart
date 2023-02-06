import 'package:finance_app/app/ui/global_controllers/session_controller.dart';
import 'package:finance_app/app/ui/pages/register/controller/register_state.dart';
import 'package:flutter_meedu/meedu.dart';
import 'register_controller.dart';

final registerProvider = StateProvider<RegisterController, RegisterState>(
    (_) => RegisterController(sessionProvider.read));
