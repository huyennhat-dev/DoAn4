import 'dart:convert';

import 'package:client/src/controller/book.dart';
import 'package:client/src/view/app/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../services/service.dart';
import '../../contains.dart';
import 'components/chapter_content.dart';
import 'components/header.dart';

final String base_Url = Service.base_Url;

class BookChapter extends StatefulWidget {
  const BookChapter(
      {super.key, required this.slugChuong, required this.truyen_id});

  final int slugChuong;
  final int truyen_id;

  @override
  State<BookChapter> createState() => _BookChapterState();
}

class _BookChapterState extends State<BookChapter> {
  BookController bookController = Get.put(BookController());
  late PageController controller;

  @override
  void initState() {
    super.initState();
    bookController.loadAllChapter(widget.truyen_id);
    controller = PageController(initialPage: widget.slugChuong - 1);
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
      body: Container(
        alignment: Alignment.topCenter,
        child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: Obx(
              () => bookController.isLoading.value
                  ? Container(height: 50)
                  : PageView.builder(
                      controller: controller,
                      itemCount: bookController.chapters!.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Column(
                            children: [
                              BookChapterHeader(
                                chapterName: "Chương ${index + 1}: " +
                                    bookController.chapters![index].tenchuong
                                        .toString(),
                                onPressed: () => showModalBottomSheet(
                                  context: context,
                                  builder: (context) => Container(),
                                ),
                              ),
                              Expanded(
                                  flex: 1,
                                  child: BookChapterContent(
                                    truyenId: widget.truyen_id.toString(),
                                    slug: bookController.chapters![index].slug
                                        .toString(),
                                  ))
                            ],
                          )),
            )),
      ),
    );
  }
}
