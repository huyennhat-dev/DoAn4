import 'package:client/src/view/app/book/book.dart';
import 'package:client/src/view/app/book/book_read.dart';
import 'package:client/src/view/app/book/bookcase.dart';
import 'package:client/src/view/app/chapter/book_for_you_page.dart';
import 'package:client/src/view/app/chapter/chapter.dart';
import 'package:client/src/view/app/login.dart';
import 'package:client/src/view/app/search/search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/home.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Canabook',
      initialRoute: '/',
      getPages: [
        GetPage(
            name: '/',
            page: () => HomePage(),
            transition: Transition.cupertino),
        GetPage(
            name: '/login',
            page: () => LoginScreen(),
            transition: Transition.cupertino),
        GetPage(
            name: '/book',
            page: () => BookPage(),
            transition: Transition.cupertino),
        GetPage(
            name: '/book/chapter',
            page: () => BookChapter(),
            transition: Transition.cupertino),
        GetPage(
            name: '/book/chapter/foryou',
            page: () => BookForYouPage(),
            transition: Transition.cupertino),
        GetPage(
            name: '/search',
            page: () => SearchBookPage(),
            transition: Transition.cupertino),
        GetPage(
            name: '/read-book',
            page: () => BookRead(),
            transition: Transition.cupertino),
        GetPage(
            name: '/case-book',
            page: () => BookCase(),
            transition: Transition.cupertino),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
