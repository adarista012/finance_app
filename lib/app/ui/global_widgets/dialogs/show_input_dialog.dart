import 'package:finance_app/app/utils/app_constants.dart';
import 'package:finance_app/generated/translations.g.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<String?> showInputdialog(BuildContext context,
    {String? title, String? intialValue}) async {
  String value = intialValue ?? AppConstants.empty;
  TextEditingController controller = TextEditingController();
  controller.text = value;
  final result = defaultTargetPlatform != TargetPlatform.iOS
      ? await showDialog<String>(
          context: context,
          builder: (context) => AlertDialog(
            title: title != null ? Text(title) : null,
            content: CupertinoTextField(
              controller: controller,
              onChanged: (text) {
                value = text;
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, value);
                },
                // isDefaultAction: true,
                child: Text(texts.drawer.save),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                // isDestructiveAction: true,
                child: Text(texts.drawer.cancel),
              ),
            ],
          ),
        )
      : await showCupertinoDialog<String>(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: title != null ? Text(title) : null,
            content: CupertinoTextField(
              controller: controller,
              onChanged: (text) {
                value = text;
              },
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context, value);
                },
                isDefaultAction: true,
                child: Text(texts.drawer.save),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                isDestructiveAction: true,
                child: Text(texts.drawer.cancel),
              ),
            ],
          ),
        );
  controller.dispose();
  if (result != null && result.trim().isEmpty) {
    return null;
  }
  return result;
}
