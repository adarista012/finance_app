import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:intl/intl.dart';

import 'controller/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (_, ref, __) {
            final controller = ref.watch(homeProvider);
            return Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("${controller.counter}"),
                Text(NumberFormat.currency().format(12888.50)),
                Text(DateFormat.EEEE().format(DateTime.now())),
                CalendarDatePicker(initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.now(), onDateChanged:(DateTime){}
                ),
              ],
            ));
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: homeProvider.read.increment,
      ),
    );
  }
}
  