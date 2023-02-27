import 'package:finance_app/app/ui/pages/home/widgets/my_drawer.dart';
import 'package:finance_app/app/ui/pages/home/widgets/my_floating_action_button.dart';
import 'package:finance_app/app/ui/pages/home/widgets/my_header.dart';
import 'package:finance_app/app/ui/pages/home/widgets/my_total_card.dart';
import 'package:finance_app/app/ui/global_widgets/tween_animation_name.dart';
import 'package:finance_app/app/ui/routes/routes.dart';
import 'package:finance_app/app/utils/app_constants.dart';
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
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_sharp),
            onPressed: () {
              router.pushNamed(Routes.SETTINGS,
                  transition: Transition.rightToLeft);
            },
          ),
        ],
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
                          : Padding(
                              padding: const EdgeInsets.only(
                                top: 44.0,
                              ),
                              child: RefreshIndicator(
                                onRefresh: controller.getFirebaseExpenses,
                                child: ListView(
                                  children: controller.listDismissibles,
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
                TweenAnimationName(
                  text: AppConstants.nameOfApp.substring(0, 5),
                  isLeft: true,
                ),
                TweenAnimationName(
                  text: AppConstants.nameOfApp.substring(5),
                  isLeft: false,
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
