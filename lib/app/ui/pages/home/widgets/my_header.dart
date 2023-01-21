import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:finance_app/app/ui/pages/home/controller/home_controller.dart';

class MyHeader extends StatelessWidget {
  final HomeController controller;
  const MyHeader({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30.0),
          bottomRight: Radius.circular(30.0),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 201, 201, 201),
            blurRadius: 1,
            spreadRadius: 1.6,
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            texts.total,
            // 'Total of ${DateFormat('MMMM').format(DateTime.now())}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24.0,
            ),
          ),
          RichText(
            text: TextSpan(
              text: NumberFormat.currency().format(controller.amount()),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
