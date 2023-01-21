import 'package:finance_app/app/ui/pages/home/widgets/my_dropdown_button.dart';
import 'package:finance_app/app/ui/pages/home/widgets/my_floating_action_button.dart';
import 'package:finance_app/app/ui/pages/home/widgets/my_header.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:intl/intl.dart';
import 'controller/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          MyDropDownButton()
        ],
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: Consumer(
          builder: (_, ref, __) {
            final controller =
                ref.watch(homeProvider.select((p0) => p0.listDismissibles));
            return Column(
              children: [
                Flexible(
                  flex: 1,
                  child: MyHeader(controller: controller),
                ),
                Flexible(
                    flex: 4,
                    child: controller.isLoading == true
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : RefreshIndicator(
                            onRefresh: controller.getFirebaseExpenses,
                            child: ListView(
                              children: controller.listDismissibles,
                            ),
                          )),
              ],
            );
          },
        ),
      ),
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}
