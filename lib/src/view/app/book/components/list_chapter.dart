import 'package:client/src/view/app/utils/heading.dart';
import 'package:client/src/view/contains.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../model/list_chapter.dart';

class ListChapter extends StatefulWidget {
  const ListChapter(
      {super.key, required this.chapters, required this.truyenid});

  final List<Danhsachchuong> chapters;
  final int truyenid;

  @override
  State<ListChapter> createState() => _ListChapterState();
}

class _ListChapterState extends State<ListChapter> {
  bool reversed = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(
          horizontal: kDefautPadding / 1, vertical: kDefautPadding / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppHeading(
              title: 'Danh sách chương',
              onPressed: () {},
              status: true,
              icon: Icon(CupertinoIcons.book, color: Colors.white, size: 20)),
          _buildListChapter(context, widget.chapters, size)
        ],
      ),
    );
  }

  Widget _buildListChapter(BuildContext context, List chapters, Size size) =>
      Container(
        width: size.width - kDefautPadding * 2,
        decoration: BoxDecoration(
          color: kButtonColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          children: [
            Container(
              height: 40,
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefautPadding / 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Số chương (${chapters.length})',
                      style: GoogleFonts.mulish(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 14)),
                  GestureDetector(
                      onTap: () => setState(() => reversed = !reversed),
                      child: Icon(Icons.sort_sharp,
                          color: reversed ? Colors.white : Colors.white30,
                          size: 24))
                ],
              ),
            ),
            Container(
              height: (chapters.length) <= 10
                  ? (chapters.length) * 35 + (chapters.length + 1) * 5
                  : 35 * 10 + 5 * 11,
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefautPadding / 4),
              constraints: BoxConstraints(
                maxHeight: 35 * 10 + 5 * 11,
                minHeight: 0,
              ),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                child: ListView(
                  reverse: reversed,
                  physics: BouncingScrollPhysics(),
                  children: [
                    const SizedBox(height: 5),
                    for (int i = 0; i <= chapters.length - 1; i++)
                      _buildChapterItem(context, i, size),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget _buildChapterItem(BuildContext context, int index, Size size) =>
      GestureDetector(
        onTap: () => Get.toNamed('/book/chapter', arguments: {
          'truyen_id': widget.truyenid,
          'slug': int.parse(widget.chapters[index].slug!)
        }),
        child: Container(
          height: 35,
          margin: const EdgeInsets.only(bottom: kDefautPadding / 4),
          padding: const EdgeInsets.all(kDefautPadding / 3),
          decoration: BoxDecoration(
              color: kTertiaryColor, borderRadius: BorderRadius.circular(7)),
          child: Row(
            children: [
              Icon(Icons.book, color: Colors.white, size: 15),
              const SizedBox(width: kDefautPadding / 3),
              SizedBox(
                width: size.width - kDefautPadding * 2 - 50,
                child: Text(
                  'Chương ${index + 1}: ${widget.chapters[index].tenchuong}',
                  style: GoogleFonts.mulish(
                      color: textColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],
          ),
        ),
      );
}
