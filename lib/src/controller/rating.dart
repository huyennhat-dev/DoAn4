import 'package:client/src/helpers/shared_pref.dart';
import 'package:client/src/repo/book.dart';
import 'package:client/src/view/app/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/service.dart';
import '../view/contains.dart';

class RatingController extends GetxController {
  String appName = Service.appFirstName + Service.appLastName;

  RxBool isloaing = false.obs;

  TextEditingController controller = TextEditingController();

  void postRating(rate, id, content) async {
    try {
      isloaing(true);
      final uid = await SharedPref().read("UID") ?? "";
      if (uid.isNotEmpty) {
        if (content.length < 5 || content.length > 250) {
          Get.snackbar(appName + " thông báo", "Nội dung không hợp lệ!",
              titleText:
                  Text(appName + " thông báo", style: SnackBarStyle.kTitle),
              messageText:
                  Text("Nội dung không hợp lệ!", style: SnackBarStyle.kMessage),
              duration: Duration(seconds: 3),
              icon: Icon(CupertinoIcons.exclamationmark_circle,
                  color: kWarninngColor, size: 30),
              backgroundColor: Colors.white.withOpacity(0.35),
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefautPadding / 1,
                  vertical: kDefautPadding / 1.5));
        } else {
          await BookRepo.postRating({
            "uid": uid,
            "rate": rate,
            "truyenid": id,
            "content": content,
          }).then((value) {
            controller.clear();
            Get.snackbar(
                appName + " thông báo",
                value['success']
                    ? "Đánh giá truyện thành công!"
                    : "Bạn đã đánh giá truyền này rồi!",
                titleText:
                    Text(appName + " thông báo", style: SnackBarStyle.kTitle),
                messageText: Text(
                    value['success']
                        ? "Đánh giá truyện thành công!"
                        : "Bạn đã đánh giá truyền này rồi!",
                    style: SnackBarStyle.kMessage),
                duration: Duration(seconds: 3),
                icon: Icon(CupertinoIcons.checkmark_alt_circle,
                    color: value['success'] ? kSuccessColor : kWarninngColor,
                    size: 30),
                backgroundColor: Colors.white.withOpacity(0.35),
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefautPadding / 1,
                    vertical: kDefautPadding / 1.5));
          });
        }
      } else {
        Get.off(LoginScreen(),
            duration: const Duration(milliseconds: 500),
            transition: Transition.cupertino);
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      isloaing(false);
    }
  }
}
