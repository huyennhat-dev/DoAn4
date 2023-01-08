import 'package:client/src/model/chapter.dart';
import 'package:client/src/repo/chapter.dart';
import 'package:client/src/view/app/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

import '../../../../helpers/shared_pref.dart';
import '../../../contains.dart';

class BookChapterContent extends StatefulWidget {
  const BookChapterContent(
      {super.key,
      required this.truyenId,
      required this.slug,
      required this.nextPage});

  final int truyenId;
  final String slug;
  final bool nextPage;

  @override
  State<BookChapterContent> createState() => _BookChapterContentState();
}

class _BookChapterContentState extends State<BookChapterContent> {
  late Future<Chapter> futureChapter;
  ScrollController controller = ScrollController();

  Future<Chapter> loadChapter() async {
    try {
      final body = await ChapterRepo.fetchChapter(
          await SharedPref().read('UID') ?? -1, widget.truyenId, widget.slug);
      return Chapter.fromJson(body);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void initState() {
    futureChapter = loadChapter();
    controller.addListener(() {
      if (controller.position.pixels == controller.position.maxScrollExtent &&
          widget.nextPage) {
        Get.toNamed('/book/chapter/foryou',
            arguments: {'truyen_id': widget.truyenId});
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureChapter,
      builder: (context, snp) {
        if (snp.hasData) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            controller: controller,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefautPadding / 2,
                    vertical: kDefautPadding / 4),
                child: Html(
                  data: snp.data!.noidung,
                  style: {
                    "body": Style(
                        fontSize: FontSize(16.0),
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Mulish',
                        color: textColor,
                        wordSpacing: 2)
                  },
                ),
              ),
              const SizedBox(height: 60)
            ],
          );
        }
        return Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: kDefautPadding * 2),
          child: LoadingWidget(
            message: "Loading...",
          ),
        );
      },
    );
  }
}
