import 'package:flutter/material.dart';

class LoadingDialog {
  static void showLoadingDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(7)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                  width: 30,
                  height: 30,
                  child: CircularProgressIndicator(strokeWidth: 1.5)),
              const SizedBox(width: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(message),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static hideLoadingDialog(BuildContext context) {
    Navigator.of(context).pop(LoadingDialog);
  }
}
