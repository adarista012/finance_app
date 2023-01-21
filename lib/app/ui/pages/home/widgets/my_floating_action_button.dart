import 'package:finance_app/app/domain/models/expense.dart';
import 'package:finance_app/app/ui/pages/home/controller/home_provider.dart';
import 'package:finance_app/app/ui/pages/home/widgets/my_modal_bottom_sheet.dart';
import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet<Expense>(
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
          context: context,
          builder: (_) {
            return const MyModalBottomSheet();
          },
        ).whenComplete(() => homeProvider.read.setCurrentImage(null));
      },
      child: const Icon(
        Icons.add,
      ),
    );
  }
}
