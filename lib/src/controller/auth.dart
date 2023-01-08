import 'package:client/src/model/user.dart';
import 'package:client/src/repo/auth.dart';
import 'package:client/src/services/service.dart';
import 'package:client/src/view/contains.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/shared_pref.dart';
import '../services/google_sign_in.dart';

class AuthController extends GetxController {
  RxBool isloading = false.obs;
  String appName = Service.appFirstName + Service.appLastName;
  signIn() async {
    try {
      isloading(true);

      final user = await GoogleSignInApi.login();

      if (user == null) {
        Get.snackbar(
            appName + " thông báo", "Đăng nhập thất bại, đã có lỗi xảy ra",
            titleText:
                Text(appName + " thông báo", style: SnackBarStyle.kTitle),
            messageText: Text("Đăng nhập thất bại, đã có lỗi xảy ra",
                style: SnackBarStyle.kMessage),
            duration: Duration(seconds: 3),
            icon: const Icon(CupertinoIcons.exclamationmark_circle,
                color: kErrorColor, size: 30),
            backgroundColor: Colors.white.withOpacity(0.35),
            padding: const EdgeInsets.symmetric(
                horizontal: kDefautPadding / 1,
                vertical: kDefautPadding / 1.5));
      } else {
        User u = await signInGoogle({
          "email": user.email,
          'username': user.displayName,
          'imageUrl': user.photoUrl,
          'password': "truyencv123"
        });
        await SharedPref().save('UID', u.id.toString());
        await SharedPref().save('UEMAIL', u.email.toString());
        await SharedPref().save('USERNAME', u.username.toString());
        await SharedPref().save('UPHOTO', u.avatar.toString());

        Get.offAllNamed('/');

        Get.snackbar(appName + " thông báo",
            "Đăng nhập thành công, xin chào ${u.username}",
            titleText:
                Text(appName + " thông báo", style: SnackBarStyle.kTitle),
            messageText: Text("Đăng nhập thành công, xin chào ${u.username}",
                style: SnackBarStyle.kMessage),
            duration: Duration(seconds: 3),
            icon: const Icon(CupertinoIcons.checkmark_alt_circle,
                color: kSuccessColor, size: 30),
            backgroundColor: Colors.white.withOpacity(0.35),
            padding: const EdgeInsets.symmetric(
                horizontal: kDefautPadding / 1,
                vertical: kDefautPadding / 1.5));
      }
    } catch (e) {
      throw Exception(e);
    } finally {
      isloading(false);
    }
  }

  Future<User> signInGoogle(data) async {
    final body = await AuthRepo.googleSignIn(data);
    if (body['success']) return User.fromJson(body['user']);
    throw Exception("Đăng nhập thất bại");
  }
}
