import 'package:finance_app/app/ui/global_controllers/session_controller.dart';
import 'package:finance_app/app/ui/pages/home/widgets/my_dropdown_button.dart';
import 'package:finance_app/app/ui/pages/home/widgets/my_floating_action_button.dart';
import 'package:finance_app/app/ui/pages/home/widgets/my_header.dart';
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
        // leading: IconButton(
        //   onPressed: () {
        //     sessionProvider.read.signOut();
        //   },
        //   icon: const Icon(Icons.logout),
        // ),
        title: Consumer(builder: (_, watch, __) {
          final user = watch.watch(sessionProvider).user;
          return Text(user?.displayName ?? '');
        }),
        elevation: 0.0,
        actions: const [MyDropDownButton()],
      ),
      // drawer:
      body: SizedBox(
        height: height,
        width: width,
        child: Consumer(
          builder: (_, ref, __) {
            final controller =
                ref.watch(homeProvider.select((p0) => p0.listDismissibles));
            return Column(
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
