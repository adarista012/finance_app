import 'package:finance_app/app/ui/pages/detail/controller/detail_provider.dart';
import 'package:finance_app/app/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, ___) {
      final controller = ref.watch(detailProvider);
      return Scaffold(
        appBar: AppBar(
          title: Text(controller.currentExpense.detail ?? AppConstants.empty),
        ),
      );
    });
  }
}
