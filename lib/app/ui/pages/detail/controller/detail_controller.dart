import 'package:finance_app/app/domain/models/expense.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:flutter_meedu/ui.dart';

class DetailController extends SimpleNotifier {
  late final Expense currentExpense;
  DetailController() {
    _init();
  }
  void _init() {
    currentExpense = router.arguments as Expense;
  }
}
