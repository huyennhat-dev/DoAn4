import 'package:client/src/view/contains.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowSnackBar {
  static void show(
      BuildContext context, String title, String message, Icon icon) {
    Get.snackbar(
      title,
      message,
      icon: icon,
      titleText: Text(
        title,
      ),
      messageText: Text(message),
      duration: const Duration(seconds: 4),
      backgroundColor: Colors.white.withOpacity(0.4),
      padding: EdgeInsets.symmetric(
          horizontal: kDefautPadding / 2, vertical: kDefautPadding / 2),
      margin: EdgeInsets.all(kDefautPadding / 2),
      borderRadius: 7,
    );
  }
}
