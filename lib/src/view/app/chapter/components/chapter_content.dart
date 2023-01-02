import 'package:client/src/model/chapter.dart';
import 'package:client/src/repo/chapter.dart';
import 'package:client/src/view/app/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../../helpers/shared_pref.dart';
import '../../../contains.dart';

class BookChapterContent extends StatefulWidget {
  const BookChapterContent(
      {super.key, required this.truyenId, required this.slug});

  final String truyenId;
  final String slug;

  @override
  State<BookChapterContent> createState() => _BookChapterContentState();
}

class _BookChapterContentState extends State<BookChapterContent> {
  late Future<Chapter> futureChapter;
  String? cusId;

  Future<Chapter> loadChapter() async {
    try {
      String? uid = await SharedPref().read('UID');
      final body = await ChapterRepo.fetchChapter(
          uid != null ? uid : -1, widget.truyenId, widget.slug);
      return Chapter.fromJson(body);
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  void initState() {
    futureChapter = loadChapter();
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
                        wordSpacing: 2),
                  },
                ),
              ),
              const SizedBox(height: 30)
            ],
          );
        }
        return Container(
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: kDefautPadding * 2),
          child: LoadingWidget(
            message: "Loading...",
          ),
        );
      },
    );
  }
}
