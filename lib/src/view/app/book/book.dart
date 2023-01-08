import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/src/controller/book.dart';
import 'package:client/src/controller/home.dart';
import 'package:client/src/view/app/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../helpers/shared_pref.dart';
import '../../../services/service.dart';
import '../../contains.dart';
import 'components/book_information.dart';
import 'components/header.dart';
import 'components/list_chapter.dart';

import 'components/nominations.dart';

class BookPage extends StatefulWidget {
  const BookPage({
    super.key,
  });

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final ScrollController _scrollController = ScrollController();
  BookController bookController = Get.put(BookController());
  String uid = "";
  @override
  void initState() {
    Get.delete<BookController>();

    setUid();
    bookController.loadBook(Get.parameters['id']);
    super.initState();
  }

  setUid() async {
    final String x = await SharedPref().read("UID") ?? '-1';
    setState(() => uid = x);
  }

  @override
  void dispose() {
    Get.delete<BookController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          backgroundColor: kPrimaryColor,
        ),
        body: Container(
            alignment: Alignment.topCenter,
            constraints: const BoxConstraints.expand(),
            child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: Obx(
                      () => bookController.isLoading.value
                          ? Container(
                              height: size.height,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefautPadding * 2),
                              child: LoadingWidget(
                                message: "Loading...",
                              ),
                            )
                          : Stack(children: [
                              CachedNetworkImage(
                                imageUrl:
                                    '$base_Url/tcv/public/uploads/truyen/' +
                                        bookController.book!.hinhanh.toString(),
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: 260,
                                  width: size.width,
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 0),
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: imageProvider,
                                          fit: BoxFit.cover)),
                                  child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 10.0, sigmaY: 10.0),
                                      child: Container()),
                                ),
                                placeholder: (context, url) => Container(
                                    alignment: Alignment.center,
                                    height: 160,
                                    width: size.width,
                                    child: CircularProgressIndicator(
                                        color: kSecondaryColor,
                                        strokeWidth: 1.5)),
                                errorWidget: (context, url, error) => Container(
                                    alignment: Alignment.center,
                                    height: 160,
                                    width: size.width,
                                    child:
                                        Icon(Icons.error, color: kErrorColor)),
                              ),
                              Column(
                                children: [
                                  BookPageHeader(
                                      onPressed: () => Navigator.pop(context)),
                                  BookInfomation(
                                      controller: bookController,
                                      scrollController: _scrollController),
                                  ListChapter(
                                      truyenid:
                                          bookController.book!.id!.toInt(),
                                      chapters:
                                          bookController.book!.danhsachchuong!),
                                  Nominations(
                                      uid: int.parse(uid),
                                      bookController: bookController)
                                ],
                              ),
                            ]),
                    )))));
  }
}
