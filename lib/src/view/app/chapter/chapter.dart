import 'package:client/src/controller/chapter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/service.dart';
import '../../contains.dart';
import 'components/chapter_content.dart';
import 'components/header.dart';

final String base_Url = Service.base_Url;

class BookChapter extends StatefulWidget {
  const BookChapter({super.key});

  @override
  State<BookChapter> createState() => _BookChapterState();
}

class _BookChapterState extends State<BookChapter> {
  ChapterController chapterController = Get.put(ChapterController());
  late PageController controller;

  @override
  void initState() {
    Get.delete<ChapterController>();

    chapterController.loadAllChapter(Get.arguments['truyen_id']);
    controller = PageController(initialPage: Get.arguments['slug'] - 1);

    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ChapterController>();
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
        body: Container(
          alignment: Alignment.topCenter,
          child: ScrollConfiguration(
            behavior: MyBehavior(),
            child: Obx(() => chapterController.isLoading.value
                ? Container(height: 50)
                : PageView.builder(
                    controller: controller,
                    itemCount: chapterController.chapters!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          BookChapterHeader(
                              chapterName: "Chương ${index + 1}: " +
                                  chapterController.chapters![index].tenchuong
                                      .toString(),
                              onPressed: () => showModalBottomSheet(
                                    context: context,
                                    builder: (context) => Container(),
                                  )),
                          Expanded(
                              flex: 1,
                              child: BookChapterContent(
                                  nextPage:
                                      chapterController.chapters!.length ==
                                          int.parse(chapterController
                                              .chapters![index].slug
                                              .toString()),
                                  truyenId: Get.arguments['truyen_id'],
                                  slug: chapterController.chapters![index].slug
                                      .toString()))
                        ],
                      );
                    })),
          ),
        ));
  }
}
