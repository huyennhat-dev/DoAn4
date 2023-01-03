import 'package:client/src/helpers/shared_pref.dart';
import 'package:client/src/model/decu.dart';
import 'package:client/src/view/app/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/book.dart';
import '../repo/book.dart';
import '../services/service.dart';
import '../view/contains.dart';

class BookController extends GetxController {
  String appName = Service.appFirstName + Service.appLastName;
  Book? book;
  RxBool isLoading = false.obs;
  List<dynamic> topdecus = List<dynamic>.empty(growable: true).obs;

  loadBook(id) async {
    try {
      isLoading(true);
      final body =
          await BookRepo.fetchBook(await SharedPref().read("UID") ?? -1, id);
      book = Book.fromJson(body);
      topdecus.addAll(
          body['topdecu'].map((data) => Topdecu.fromJson(data)).toList());
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading(false);
    }
  }

  bookMark(id) async {
    try {
      final uid = await SharedPref().read("UID") ?? "";
      if (uid.isNotEmpty) {
        await BookRepo.bookMark({"truyen_id": id, "cus_id": uid}).then((value) {
          Get.snackbar(
              appName + " thông báo",
              value['success']
                  ? "Thêm vào tủ truyện thành công"
                  : "Xóa truyện này khỏi tủ thành công",
              titleText:
                  Text(appName + " thông báo", style: SnackBarStyle.kTitle),
              messageText: Text(
                  value['success']
                      ? "Thêm vào tủ truyện thành công"
                      : "Xóa truyện này khỏi tủ thành công",
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
      } else {
        Get.snackbar(appName + " thông báo",
            "Bạn phải đăng nhập để sử dụng chức năng này!",
            titleText:
                Text(appName + " thông báo", style: SnackBarStyle.kTitle),
            messageText: Text("Bạn phải đăng nhập để sử dụng chức năng này!",
                style: SnackBarStyle.kMessage),
            duration: Duration(seconds: 3),
            icon: const Icon(CupertinoIcons.exclamationmark_circle,
                color: kWarninngColor, size: 30),
            backgroundColor: Colors.white.withOpacity(0.35),
            padding: const EdgeInsets.symmetric(
                horizontal: kDefautPadding / 1,
                vertical: kDefautPadding / 1.5));
        Get.off(
          const LoginScreen(),
          transition: Transition.cupertino,
          duration: const Duration(milliseconds: 300),
        );
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  delRating(id) async {
    try {
      await BookRepo.delRating(id).then((value) {
        if (value['success']) {
          topdecus.removeWhere((element) => element.rateid == id);
          update();
          Get.snackbar(appName + " thông báo", "Xóa đánh giá thành công",
              titleText:
                  Text(appName + " thông báo", style: SnackBarStyle.kTitle),
              messageText: Text("Xóa đánh giá thành công",
                  style: SnackBarStyle.kMessage),
              duration: Duration(seconds: 3),
              icon: Icon(CupertinoIcons.checkmark_alt_circle,
                  color: kSuccessColor, size: 30),
              backgroundColor: Colors.white.withOpacity(0.35),
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefautPadding / 1,
                  vertical: kDefautPadding / 1.5));
        }
      });
    } catch (e) {
      throw Exception(e);
    }
  }
}
