import 'package:finance_app/app/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';

abstract class Dialogs {
  static Future<void> alert(
    BuildContext context,
    {
    String? title,
    String? content,
    String okText = AppConstants.ok,

    }
    ) {
    return showCupertinoDialog(
      context: context, 
      builder: (_) => CupertinoAlertDialog(
        title: title == null ? null : Text(title),
        content: content ==  null ? null : Text(content),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(_),
            child: Text(okText),
          ),
        ],
      ),
    );
  }
}
