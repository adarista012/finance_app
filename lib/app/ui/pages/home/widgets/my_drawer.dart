// ignore_for_file: use_build_context_synchronously

import 'package:finance_app/app/ui/global_controllers/session_controller.dart';
import 'package:finance_app/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:finance_app/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:finance_app/app/ui/global_widgets/dialogs/show_input_dialog.dart';
import 'package:finance_app/app/ui/pages/home/widgets/my_dropdown_button.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColorsTheme.grey,
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomCenter,
              color: AppColorsTheme.kPink,
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              child: Consumer(
                builder: (_, watch, __) {
                  final user = watch.watch(sessionProvider).user;
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      user?.photoURL != null
                          ? CircleAvatar(
                              radius: 56,
                              backgroundImage: NetworkImage(user!.photoURL!),
                              child: user.photoURL == null
                                  ? Text(
                                      user.displayName != null
                                          ? user.displayName![0].toUpperCase()
                                          : user.email != null
                                              ? user.email![0].toUpperCase()
                                              : '',
                                      style: TextStyle(
                                        color: AppColorsTheme.white,
                                        fontSize: 80,
                                      ),
                                    )
                                  : null,
                            )
                          : CircleAvatar(
                              radius: 56,
                              child: user!.photoURL == null
                                  ? Text(
                                      user.displayName != null
                                          ? user.displayName![0].toUpperCase()
                                          : user.email != null
                                              ? user.email![0].toUpperCase()
                                              : '',
                                      style: TextStyle(
                                        color: AppColorsTheme.white,
                                        fontSize: 80,
                                      ),
                                    )
                                  : null,
                            ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            user.displayName ?? 'nick name',
                            style: TextStyle(
                              color: AppColorsTheme.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          IconButton(
                            onPressed: () async {
                              final value = await showInputdialog(context,
                                  intialValue:
                                      sessionProvider.read.user!.displayName ??
                                          '');
                              if (value != null) {
                                ProgressDialog.show(context);
                                final user = await sessionProvider.read
                                    .updateDisplayName(value);
                                Navigator.pop(context);
                                if (user == null) {
                                  Dialogs.alert(
                                    context,
                                    title: texts.login.error,
                                    content:
                                        texts.drawer.checkYourInternetConection,
                                  );
                                }
                              }
                            },
                            icon: Icon(
                              Icons.edit,
                              color: AppColorsTheme.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Flexible(
            flex: 5,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    texts.drawer.languageAndRegion,
                  ),
                ),
                Container(
                  color: AppColorsTheme.white,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 8.0),
                  child: const MyDropDownButton(),
                ),
                Expanded(child: Container()),
                Container(
                  color: AppColorsTheme.white,
                  margin: const EdgeInsets.symmetric(vertical: 32.0),
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      sessionProvider.read.signOut();
                    },
                    child: Text(
                      texts.login.logOut,
                      style: TextStyle(
                        color: AppColorsTheme.red,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
