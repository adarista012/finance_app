import 'package:finance_app/app/ui/pages/home/controller/home_provider.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:intl/intl.dart';
import 'package:finance_app/generated/translations.g.dart';

class MyHeader extends StatelessWidget {
  const MyHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) {
        final controller =
            ref.watch(homeProvider.select((p0) => p0.listDismissibles));
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
                texts.home.total(
                  month: DateFormat('MMMM').format(
                    DateTime.now(),
                  ),
                ),
                style: TextStyle(
                  color: AppColorsTheme.white,
                  fontSize: 24.0,
                ),
              ),
              RichText(
                text: TextSpan(
                  text: NumberFormat.currency().format(controller.amount()),
                  style: TextStyle(
                    color: AppColorsTheme.white,
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
