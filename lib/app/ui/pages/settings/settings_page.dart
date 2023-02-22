// ignore_for_file: use_build_context_synchronously

import 'package:finance_app/app/ui/global_controllers/session_controller.dart';
import 'package:finance_app/app/ui/global_widgets/dialogs/dialogs.dart';
import 'package:finance_app/app/ui/global_widgets/dialogs/progress_dialog.dart';
import 'package:finance_app/app/ui/global_widgets/dialogs/show_input_dialog.dart';
import 'package:finance_app/app/ui/pages/home/widgets/my_dropdown_button.dart';
import 'package:finance_app/app/utils/app_colors_theme.dart';
import 'package:finance_app/app/utils/app_constants.dart';
import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.bottomCenter,
              color: AppColorsTheme.kPink,
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
                                      user.displayName != null &&
                                              user.displayName !=
                                                  AppConstants.empty
                                          ? user.displayName![0].toUpperCase()
                                          : user.email != null
                                              ? user.email![0].toUpperCase()
                                              : AppConstants.empty,
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
                                      user.displayName != null &&
                                              user.displayName !=
                                                  AppConstants.empty
                                          ? user.displayName![0].toUpperCase()
                                          : user.email != null
                                              ? user.email![0].toUpperCase()
                                              : AppConstants.empty,
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
                            user.displayName != AppConstants.empty &&
                                    user.displayName != null
                                ? user.displayName!
                                : AppConstants.nickName,
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
                                          AppConstants.empty);
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
            Padding(
              padding: const EdgeInsets.only(
                top: 8.0,
                left: 8.0,
                right: 8.0,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Row(
                  children: [
                    Text(
                      '${texts.drawer.languageAndRegion} ',
                    ),
                    Icon(
                      Icons.language,
                      color: Colors.grey.shade800,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: AppColorsTheme.white,
                width: double.infinity,
                padding: const EdgeInsets.only(left: 8.0),
                child: const MyDropDownButton(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
              ),
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: Row(
                  children: [
                    const Text(
                      'email verified ',
                    ),
                    Icon(
                      Icons.verified_user,
                      color: Colors.grey.shade800,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 45,
                alignment: Alignment.centerLeft,
                color: AppColorsTheme.white,
                width: double.infinity,
                padding: const EdgeInsets.all(8.0),
                child:
                    Text(sessionProvider.read.user!.emailVerified.toString()),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: AppColorsTheme.white,
                margin: const EdgeInsets.symmetric(vertical: 32.0),
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    ProgressDialog.show(context);
                    await sessionProvider.read.signOut();
                  },
                  child: Text(
                    texts.login.logOut,
                    style: TextStyle(
                      color: AppColorsTheme.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
