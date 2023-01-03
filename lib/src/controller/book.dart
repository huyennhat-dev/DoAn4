import 'package:client/src/helpers/shared_pref.dart';
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

  RxBool isLoading = false.obs;
  Book? book;

  loadBook(id) async {
    try {
      isLoading(true);
      final body =
          await BookRepo.fetchBook(await SharedPref().read("UID") ?? -1, id);
      book = Book.fromJson(body);
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading(false);
    }
  }

  bookMark(id) async {
    try {
      final uid = await SharedPref().read("UID") ?? null;
      print(uid);
      // if (uid.isNotEmpty) {
      //   final body = await BookRepo.bookMark({"truyen_id": id, "cus_id": uid});
      // } else {
      //   Get.snackbar(appName + " thông báo",
      //       "Bạn phải đăng nhập để sử dụng chức năng này!",
      //       titleText:
      //           Text(appName + " thông báo", style: SnackBarStyle.kTitle),
      //       messageText: Text("Bạn phải đăng nhập để sử dụng chức năng này!",
      //           style: SnackBarStyle.kMessage),
      //       duration: Duration(seconds: 3),
      //       icon: const Icon(CupertinoIcons.exclamationmark_circle,
      //           color: kWarninngColor, size: 30),
      //       backgroundColor: Colors.white.withOpacity(0.35),
      //       padding: const EdgeInsets.symmetric(
      //           horizontal: kDefautPadding / 1,
      //           vertical: kDefautPadding / 1.5));
      //   Get.off(
      //     const LoginScreen(),
      //     transition: Transition.cupertino,
      //     duration: const Duration(milliseconds: 300),
      //   );
      // }
    } catch (e) {
      throw Exception(e);
    }
  }
}
