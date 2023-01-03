import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/src/view/app/book/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../services/service.dart';
import '../../../contains.dart';
import '../../utils/heading.dart';

final String base_Url = Service.base_Url;

class RecentReview extends StatelessWidget {
  const RecentReview({super.key, required this.data});
  final List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: kDefautPadding / 2, horizontal: kDefautPadding / 2),
      child: Column(
        children: [
          AppHeading(
              title: 'Đánh giá gần đây',
              status: true,
              onPressed: () {},
              icon: Icon(CupertinoIcons.burst, color: Colors.white, size: 20)),
          data.length == 0
              ? Container(
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: kQuaternaryColor,
                      borderRadius: BorderRadius.circular(7)),
                  child: Text(
                    "Chưa có đánh giá nào gần đây",
                    style: GoogleFonts.mulish(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: textColor),
                  ),
                )
              : Container(
                  width: size.width - kDefautPadding,
                  height: 210,
                  child: ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView.builder(
                        itemCount: data.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) =>
                            _buildItem(context, data, index, size)),
                  ),
                )
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, data, int index, Size size) =>
      Container(
        width: data.length == 1 ? size.width - kDefautPadding : 300,
        height: 200,
        margin: index == 0
            ? const EdgeInsets.only(left: 0)
            : const EdgeInsets.only(left: kDefautPadding / 2),
        padding: const EdgeInsets.all(kDefautPadding / 2),
        decoration: BoxDecoration(
            color: kTertiaryColor, borderRadius: BorderRadius.circular(7)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  height: 35,
                  width: 35,
                  child: CachedNetworkImage(
                    imageUrl: '$base_Url/tcv/public/uploads/cus_avt/' +
                        data[index].uphoto,
                    placeholder: (BuildContext context, String url) =>
                        ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Container(
                          width: 35, height: 35, color: kQuaternaryColor),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: kDefautPadding / 3),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: data.length == 1
                        ? size.width - kDefautPadding - 118
                        : 170,
                    child: Text(
                      '${data[index].username}',
                      style: GoogleFonts.mulish(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.normal),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(height: 3),
                  SizedBox(
                    width: 170,
                    child: Text(
                      '${data[index].ngaydang}',
                      style: GoogleFonts.mulish(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5),
              SizedBox(
                child: Text(
                  'Đánh giá',
                  style: GoogleFonts.mulish(
                      color: kSecondaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 230,
                    child: Text(
                      '${data[index].tentruyen}',
                      style: GoogleFonts.mulish(
                          color: kSecondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontStyle: FontStyle.normal),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(height: 3),
                  SizedBox(
                    width: 170,
                    child: Text(
                      'Tác giả: ${data[index].tacgia}',
                      style: GoogleFonts.mulish(
                          color: textColor,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BookPage(truyen_id: data[index].truyenid))),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    width: 45,
                    child: CachedNetworkImage(
                      imageUrl: '$base_Url/tcv/public/uploads/truyen/' +
                          data[index].hinhanh,
                      placeholder: (BuildContext context, String url) =>
                          Container(
                        width: 45,
                        height: 45 * 4 / 3,
                        color: kQuaternaryColor,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              RatingBarIndicator(
                  rating: data[index].sosao,
                  itemBuilder: (context, index) =>
                      const Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 16,
                  direction: Axis.horizontal),
              const SizedBox(width: 5),
              Text(
                '( ${data[index].sosao.toStringAsFixed(1)} / 5 )',
                style: GoogleFonts.mulish(
                    color: kSecondaryColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.normal),
              ),
            ],
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: size.width - kDefautPadding,
            child: Text(
              '${data[index].noidung}',
              style: GoogleFonts.mulish(
                  color: textColor, fontSize: 13, fontWeight: FontWeight.w300),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          )
        ]),
      );
}
