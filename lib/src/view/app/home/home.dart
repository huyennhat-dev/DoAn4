import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/home.dart';
import '../../../services/service.dart';
import '../../contains.dart';
import '../widget/header.dart';
import 'components/banner.dart';
import 'components/book_for_you.dart';
import 'components/drawer.dart';
import 'components/new_book.dart';
import 'components/new_book_update.dart';
import 'components/recent_review.dart';
import 'components/top_vote.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    homeController;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
          elevation: 0, toolbarHeight: 0, backgroundColor: kPrimaryColor),
      drawer: Drawer(
          elevation: 0,
          width: size.width * 0.7,
          backgroundColor: kQuaternaryColor,
          child: AppDrawer()),
      drawerEnableOpenDragGesture: true,
      body: Container(
          alignment: Alignment.topCenter,
          constraints: const BoxConstraints.expand(),
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  AppHeader(
                    uId: '${homeController.uId}',
                    uName: '${homeController.uName}',
                    uEmail: '${homeController.uEmail}',
                    uPhoto: '${homeController.uPhoto}',
                  ),
                  AppBanner(),
                  BookForYou(),
                  NewBookUpdate(),
                  TopVote(),
                  RecentReview(),
                  NewBook()
                ],
              ),
            ),
          )),
    );
  }
}
