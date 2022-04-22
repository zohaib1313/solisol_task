import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solisoltask/utils/routes.dart';
import 'package:solisoltask/utils/styles.dart';

class AppPopUps {
  static var isDialogShowing = true;

  static showLoaderDialog(BuildContext context) {
    isDialogShowing = true;

    AlertDialog alert = AlertDialog(
      content: Row(
        children: [
          const CircularProgressIndicator(),
          Container(
              margin: const EdgeInsets.only(left: 7),
              child: const Text("Loading...")),
        ],
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    ).then((value) => isDialogShowing = false);
  }

  static dissmissDialog() {
    if (isDialogShowing) {
      navigatorKey.currentState!.pop();
    }
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(myContext!).showSnackBar(
      SnackBar(
        content: Text(
          message,
        ),
        backgroundColor: AppColor.green,
      ),
    );
  }
}
