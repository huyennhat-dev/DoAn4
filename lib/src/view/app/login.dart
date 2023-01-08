import 'package:client/src/controller/auth.dart';
import 'package:client/src/view/app/widget/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../contains.dart';
import 'utils/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController authController = Get.put(AuthController());
  bool userLogin = false;

  Future<void> googleSignIn() async {
    await authController.signIn();
  }

  @override
  void dispose() {
    Get.delete<AuthController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
          child: Obx(() => authController.isloading.value
              ? Container(
                  margin: const EdgeInsets.all(20.0),
                  child: LoadingWidget(message: 'Đang đăng nhập...'),
                )
              : Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/image/jp-art.png'),
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.bottomCenter)),
                  child: SizedBox.expand(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: kDefautPadding / 1.5,
                              vertical: kDefautPadding / 1.5),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ButtonSquare(
                                    onPressed: () => Get.back(),
                                    icon: Icon(CupertinoIcons.arrow_left,
                                        color: Colors.white, size: 20),
                                    bgColor: kButtonColor),
                                Text('Đăng nhập',
                                    style: GoogleFonts.mulish(
                                        fontSize: 24,
                                        color: textColor,
                                        fontWeight: FontWeight.w600)),
                                const SizedBox(width: 40)
                              ]),
                        ),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: googleSignIn,
                              child: Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: kDefautPadding / 2),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: kDefautPadding / 1,
                                    vertical: kDefautPadding / 3),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 30,
                                      width: 30,
                                      child: Image.asset(
                                          'assets/image/google.png',
                                          fit: BoxFit.cover),
                                    ),
                                    const SizedBox(width: 10),
                                    Text('Đăng nhập bằng Google',
                                        style: GoogleFonts.mulish(
                                            color: kPrimaryColor,
                                            fontSize: 16,
                                            decoration: TextDecoration.none,
                                            fontWeight: FontWeight.w600)),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 70)
                      ],
                    ),
                  )))),
    );
  }
}
