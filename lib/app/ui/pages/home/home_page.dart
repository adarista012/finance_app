import 'package:finance_app/app/ui/pages/home/widgets/my_drawer.dart';
import 'package:finance_app/app/ui/pages/home/widgets/my_floating_action_button.dart';
import 'package:finance_app/app/ui/pages/home/widgets/my_header.dart';
import 'package:finance_app/app/ui/pages/home/widgets/my_total_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
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
      ),
      drawer: const MyDrawer(),
      body: SizedBox(
        height: height,
        width: width,
        child: Consumer(
          builder: (_, ref, __) {
            final controller =
                ref.watch(homeProvider.select((p0) => p0.listDismissibles));
            return Stack(
              children: [
                Column(
                  children: [
                    const Flexible(
                      flex: 1,
                      child: MyHeader(),
                    ),
                    Flexible(
                      flex: 4,
                      child: controller.isLoading == true
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : RefreshIndicator(
                              onRefresh: controller.getFirebaseExpenses,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  top: 34.0,
                                ),
                                child: ListView(
                                  children: controller.listDismissibles,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
                MyTotalCard(
                  amount: controller.amount(),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: const MyFloatingActionButton(),
    );
  }
}
