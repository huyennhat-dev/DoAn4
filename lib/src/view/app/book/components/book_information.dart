import 'package:client/src/controller/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../contains.dart';
import '../../chapter/chapter.dart';
import '../../utils/button.dart';

class BookInfomation extends StatefulWidget {
  const BookInfomation(
      {super.key, required this.controller, required this.scrollController});

  final BookController controller;

  final ScrollController scrollController;

  @override
  State<BookInfomation> createState() => _BookInfomationState();
}

class _BookInfomationState extends State<BookInfomation> {
  late String firstHalf;
  late String secondHalf;

  bool bookmark = false;

  bool flag = true;

  @override
  void initState() {
    super.initState();
    bookmark = widget.controller.book!.bookmark!;
    if (widget.controller.book!.mota!.length > 250) {
      firstHalf = widget.controller.book!.mota!.substring(0, 250);
      secondHalf = widget.controller.book!.mota!
          .substring(250, widget.controller.book!.mota!.length);
    } else {
      firstHalf = widget.controller.book!.mota!;
      secondHalf = "";
    }
  }

  void onShowDesc() {
    setState(() => flag = !flag);
    flag ? scrollUp() : null;
  }

  void scrollUp() {
    widget.scrollController.animateTo(
      widget.scrollController.position.minScrollExtent + 100,
      duration: Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(
          vertical: kDefautPadding / 2, horizontal: kDefautPadding / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 40),
          Container(
            width: 180,
            height: 180 * 4 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl:
                    '$base_Url/tcv/public/uploads/truyen/${widget.controller.book!.hinhanh}',
                placeholder: (BuildContext context, String url) => Container(
                    width: 180, height: 180 * 4 / 3, color: kQuaternaryColor),
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: size.width - kDefautPadding,
            child: Text(widget.controller.book!.tentruyen!,
                maxLines: 2,
                style: GoogleFonts.mulish(
                    color: textColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: size.width - kDefautPadding,
            child: Text(
                maxLines: 1,
                'Tác giả: ${widget.controller.book!.tacgia}',
                style: GoogleFonts.mulish(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center),
          ),
          const SizedBox(height: 5),
          if (widget.controller.book!.tinhtrang == 0)
            _buildBookStatus(size, Colors.green, 'Đang tiến hành'),
          if (widget.controller.book!.tinhtrang == 1)
            _buildBookStatus(size, Colors.yellow, 'Đã hoàn thành'),
          if (widget.controller.book!.tinhtrang == 2)
            _buildBookStatus(size, Colors.red, 'Tạm ngưng'),
          const SizedBox(height: 5),
          _buildRatingGroup(),
          const SizedBox(height: 5),
          _buildButtonGroup(),
          const SizedBox(height: 10),
          _buildCategory(),
          const SizedBox(height: 10),
          _buildDescription(),
        ],
      ),
    );
  }

  Widget _buildBookStatus(Size size, Color color, String title) => SizedBox(
        width: size.width - kDefautPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(height: 7, width: 7, color: color)),
            const SizedBox(width: 5),
            Text(title,
                maxLines: 1,
                style: GoogleFonts.mulish(
                    color: textColor,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center),
          ],
        ),
      );

  Widget _buildRatingGroup() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RatingBarIndicator(
              rating: widget.controller.book!.sosao! < 0.5
                  ? 0.0
                  : widget.controller.book!.sosao!,
              itemBuilder: (context, index) =>
                  const Icon(Icons.star, color: Colors.amber),
              itemCount: 5,
              itemSize: 22,
              direction: Axis.horizontal),
          const SizedBox(width: 5),
          Text(
            '( ${widget.controller.book!.sosao! < 0.5 ? 0.0 : widget.controller.book!.sosao!.toStringAsFixed(1)} / 5 )',
            style: GoogleFonts.mulish(
                color: kSecondaryColor,
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal),
          ),
        ],
      );

  Widget _buildButtonGroup() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget.controller.book!.chuongslug! > 0
              ? ButtonCus(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookChapter(
                              truyen_id: widget.controller.book!.id!,
                              slugChuong:
                                  widget.controller.book!.chuongslug!))),
                  text: 'Đọc tiếp',
                  bgColor: kSecondaryColor,
                  textColor: textColor,
                  fontSize: 15)
              : ButtonCus(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookChapter(
                              truyen_id: widget.controller.book!.id!,
                              slugChuong: widget
                                  .controller.book!.danhsachchuong!.length))),
                  text: 'Đọc ngay',
                  bgColor: kSecondaryColor,
                  textColor: textColor,
                  fontSize: 15),
          SizedBox(width: widget.controller.book!.chuongslug! > 0 ? 0 : 10),
          widget.controller.book!.chuongslug! > 0
              ? SizedBox()
              : ButtonCus(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookChapter(
                              truyen_id: widget.controller.book!.id!,
                              slugChuong: 1))),
                  text: 'Đọc từ đầu',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  fontSize: 15),
          const SizedBox(width: 10),
          ButtonSquare(
              onPressed:()=> widget.controller.bookMark(widget.controller.book!.id),
              bgColor: Colors.transparent,
              icon: Icon(CupertinoIcons.bookmark_fill,
                  color: bookmark ? kSecondaryColor : Colors.white, size: 26)),
          ButtonSquare(
              onPressed: () {},
              bgColor: Colors.transparent,
              icon: Icon(CupertinoIcons.arrow_up_circle,
                  color: Colors.white, size: 28)),
          ButtonSquare(
              onPressed: () {},
              bgColor: Colors.transparent,
              icon:
                  Icon(Icons.download_rounded, color: Colors.white, size: 28)),
        ],
      );

  Widget _buildCategory() => Wrap(
        direction: Axis.horizontal,
        spacing: 5,
        runSpacing: 10,
        alignment: WrapAlignment.center,
        children: [
          CategoryItem(
            onPressed: () {},
            title: widget.controller.book!.theloai!,
          ),
          CategoryItem(
            onPressed: () {},
            title: widget.controller.book!.tinhcach!,
          ),
          CategoryItem(
            onPressed: () {},
            title: widget.controller.book!.thegioi!,
          ),
          CategoryItem(
            onPressed: () {},
            title: widget.controller.book!.luuphai!,
          )
        ],
      );

  Widget _buildDescription() => Column(
        children: [
          Container(
            child: Html(
              data: flag ? (firstHalf + "...") : (firstHalf + secondHalf),
              style: {
                "body": Style(
                    fontSize: FontSize(16.0),
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Mulish',
                    color: textColor,
                    wordSpacing: 2)
              },
            ),
          ),
          GestureDetector(
            onTap: () => onShowDesc(),
            child: Container(
              width: 140,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(
                  vertical: kDefautPadding / 4, horizontal: kDefautPadding / 1),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: kSecondaryColor),
                  borderRadius: BorderRadius.circular(7)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    flag ? "Đọc thêm" : "Thu gọn",
                    style: GoogleFonts.mulish(
                        color: kSecondaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                  const SizedBox(width: 5),
                  Icon(
                    size: 16,
                    color: Colors.white,
                    flag
                        ? CupertinoIcons.chevron_down
                        : CupertinoIcons.chevron_up,
                  )
                ],
              ),
            ),
          )
        ],
      );
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({Key? key, required this.title, required this.onPressed})
      : super(key: key);

  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefautPadding / 2, vertical: kDefautPadding / 4),
          decoration: BoxDecoration(
              border: Border.all(color: kSecondaryColor, width: 1),
              borderRadius: BorderRadius.circular(7)),
          child: Text(title,
              style: GoogleFonts.mulish(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w400)),
        ),
      );
}
