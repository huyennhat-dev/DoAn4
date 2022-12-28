import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:google_fonts/google_fonts.dart';

import '../../../services/google_sign_in.dart';
import '../../../services/service.dart';
import '../../../view/app/search/search.dart';
import '../../../view/app/utils/button.dart';
import '../../../view/contains.dart';

final String base_Url = Service.base_Url;

class AppHeader extends StatefulWidget {
  const AppHeader({super.key});

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  bool userLogin = false;

  void userOnclick() {
    showInfomation(context);
  }

  void showInfomation(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Dialog",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) => !userLogin
          ? _buildLoginDialog(context, _)
          : _buildLogoutDialog(context, _),
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }
        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(opacity: anim, child: child),
        );
      },
    );
  }

  Future signIn() async {
    final user = await GoogleSignInApi.login();

    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Faild"),
        ),
      );
    } else {
      print(user.photoUrl);
    }
  }

  Future<http.Response> googleSignIn(data) {
    return http.post(
      Uri.parse('$base_Url/tcv/public/api/v1/google_sign_in'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
      body: jsonEncode(data),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: kDefautPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildHeaderLeft(context),
          _buildHeaderRight(userLogin),
        ],
      ),
    );
  }

  Widget _buildHeaderLeft(BuildContext context) => Row(
        children: [
          ButtonSquare(
            onPressed: () => Scaffold.of(context).openDrawer(),
            icon: Icon(Icons.menu, color: Colors.white, size: 26),
            bgColor: Colors.transparent,
          ),
          const SizedBox(width: 10),
          Container(
            child: Text(Service.appFirstName,
                style: GoogleFonts.permanentMarker(
                    color: kSecondaryColor, fontSize: 28)),
          ),
          Container(
            child: Text(Service.appLastName,
                style: GoogleFonts.permanentMarker(
                    color: Colors.white, fontSize: 28)),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/image/logo-w.png'),
                    fit: BoxFit.cover)),
          ),
        ],
      );

  Widget _buildHeaderRight(bool loginStatus) => Row(
        children: [
          ButtonSquare(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchBookPage())),
              bgColor: kButtonColor,
              icon: Icon(CupertinoIcons.search, color: Colors.white, size: 26)),
          const SizedBox(width: 10),
          loginStatus
              ? GestureDetector(
                  onTap: () => userOnclick(),
                  child: CachedNetworkImage(
                      imageUrl:
                          'https://i.pinimg.com/736x/b7/26/73/b72673d3ac44516defb82adea9edb909.jpg',
                      imageBuilder: (context, imageProvider) => Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: kButtonColor,
                              borderRadius: BorderRadius.circular(7),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover))),
                      placeholder: (context, url) => Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: kButtonColor,
                              borderRadius: BorderRadius.circular(7))),
                      errorWidget: (context, url, error) =>
                          Icon(Icons.error, color: kErrorColor)),
                )
              : GestureDetector(
                  onTap: () => userOnclick(),
                  child: Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.circular(7)),
                      child: Icon(CupertinoIcons.person_circle,
                          color: Colors.white, size: 32)),
                )
        ],
      );

  Widget _buildLoginDialog(BuildContext context, BuildContext _) => Center(
        child: Container(
          height: 430,
          width: (MediaQuery.of(context).size.width - kDefautPadding) * 0.9,
          padding: const EdgeInsets.symmetric(
              horizontal: kDefautPadding * 1, vertical: kDefautPadding / 1),
          margin: const EdgeInsets.symmetric(horizontal: kDefautPadding / 1),
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage('assets/image/jp-art.png'),
                  fit: BoxFit.fitWidth,
                  alignment: Alignment.bottomCenter)),
          child: SizedBox.expand(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonSquare(
                          onPressed: () => Navigator.pop(context),
                          icon: Icon(CupertinoIcons.arrow_left,
                              color: Colors.white, size: 20),
                          bgColor: kButtonColor),
                      Text(
                        'Đăng nhập',
                        style: GoogleFonts.mulish(
                            fontSize: 24,
                            color: textColor,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(width: 40)
                    ]),
                const SizedBox(height: 40),
                GestureDetector(
                  onTap: signIn,
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
                          child: Image.asset('assets/image/google.png',
                              fit: BoxFit.cover),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Đăng nhập bằng Google',
                          style: GoogleFonts.mulish(
                              color: kPrimaryColor,
                              fontSize: 16,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget _buildLogoutDialog(BuildContext context, BuildContext _) => Center(
        child: Container(
          height: 330,
          width: (MediaQuery.of(context).size.width - kDefautPadding) * 0.9,
          padding: const EdgeInsets.symmetric(
              horizontal: kDefautPadding * 1, vertical: kDefautPadding / 1),
          margin: const EdgeInsets.symmetric(horizontal: kDefautPadding / 1),
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SizedBox.expand(
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: ButtonSquare(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(CupertinoIcons.arrow_left,
                          color: Colors.white, size: 20),
                      bgColor: kButtonColor),
                ),
                Positioned(
                  top: 20,
                  child: Container(
                    height: 330 - kDefautPadding * 2,
                    width:
                        ((MediaQuery.of(context).size.width - kDefautPadding) *
                                0.9) -
                            kDefautPadding * 2,
                    alignment: Alignment.topCenter,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://i.pinimg.com/736x/b7/26/73/b72673d3ac44516defb82adea9edb909.jpg',
                            imageBuilder: (context, imageProvider) => Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: kButtonColor,
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                            ),
                            placeholder: (context, url) => Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                    color: kButtonColor,
                                    borderRadius: BorderRadius.circular(50))),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error, color: kErrorColor),
                          ),
                        ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: ((MediaQuery.of(context).size.width -
                                      kDefautPadding) *
                                  0.9) -
                              kDefautPadding * 2,
                          child: Center(
                            child: Text(
                              'Huy Hoang',
                              style: GoogleFonts.mulish(
                                  color: textColor,
                                  fontSize: 22,
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w500),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        _buildLogoutItem(
                          context,
                          'Sách đã tải',
                          Icon(Icons.download, color: Colors.white, size: 24),
                          () {},
                        ),
                        const SizedBox(height: 15),
                        _buildLogoutItem(
                          context,
                          'Đăng xuất',
                          Icon(Icons.logout, color: Colors.white, size: 20),
                          () {},
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );

  Widget _buildLogoutItem(BuildContext context, String title, Icon icon,
          VoidCallback onPressed) =>
      GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 40,
          width: ((MediaQuery.of(context).size.width - kDefautPadding) * 0.9) -
              kDefautPadding * 5,
          padding: const EdgeInsets.symmetric(horizontal: kDefautPadding / 2),
          decoration: BoxDecoration(
              color: kButtonColor, borderRadius: BorderRadius.circular(7)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              icon,
              const SizedBox(width: 10),
              Text(
                title,
                style: GoogleFonts.mulish(
                    color: textColor,
                    fontSize: 18,
                    decoration: TextDecoration.none,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        ),
      );
}
