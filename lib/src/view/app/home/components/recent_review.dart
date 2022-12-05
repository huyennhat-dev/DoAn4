import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../services/service.dart';
import '../../../contains.dart';
import '../../utils/heading.dart';

final List<String> imgList = [
  'https://st.ntcdntempv3.com/data/comics/113/mairimashita-iruma-kun.jpg',
  'https://st.ntcdntempv3.com/data/comics/42/komi-khong-the-giao-tiep.jpg',
  'https://st.ntcdntempv3.com/data/comics/70/dan-anh-xau-xa.jpg',
  'https://st.ntcdntempv3.com/data/comics/78/yofukashi-no-uta.jpg',
  'https://st.ntcdntempv3.com/data/comics/113/mairimashita-iruma-kun.jpg',
  'https://st.ntcdntempv3.com/data/comics/42/komi-khong-the-giao-tiep.jpg',
  'https://st.ntcdntempv3.com/data/comics/70/dan-anh-xau-xa.jpg',
  'https://st.ntcdntempv3.com/data/comics/78/yofukashi-no-uta.jpg',
  'https://st.ntcdntempv3.com/data/comics/113/mairimashita-iruma-kun.jpg',
  'https://st.ntcdntempv3.com/data/comics/42/komi-khong-the-giao-tiep.jpg',
  'https://st.ntcdntempv3.com/data/comics/70/dan-anh-xau-xa.jpg',
  'https://st.ntcdntempv3.com/data/comics/78/yofukashi-no-uta.jpg',
  'https://st.ntcdntempv3.com/data/comics/59/sore-wa-rei-no-shiwaza-desu.jpg'
];

class RecentReview extends StatefulWidget {
  const RecentReview({super.key});

  @override
  State<RecentReview> createState() => _RecentReviewState();
}

class _RecentReviewState extends State<RecentReview> {
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
          Container(
            width: size.width - kDefautPadding,
            height: 245,
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.builder(
                  itemCount: imgList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) =>
                      _buildItem(index, size)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem(int index, Size size) => Container(
        width: 300,
        height: 220,
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
                    imageUrl:
                        'https://kyoto-manga-proxy-5niz.onrender.com/proxy?url=http://www.nettruyenme.com&src=https://st.ntcdntempv3.com/data/comics/220/ta-that-su-khong-phai-la-cai-the-cao-nha-3904.jpg',
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
                children: [
                  SizedBox(
                    width: 170,
                    child: Text(
                      'Trần Ngọc Hân Nhi',
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
                      '24 ngày trước',
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
                      'Đảo hải tặc duy nhất trên thế giới',
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
                      'Tác giả: Oda Eiichiro',
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
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  width: 45,
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://kyoto-manga-proxy-5niz.onrender.com/proxy?url=http://www.nettruyenme.com&src=https://st.ntcdntempv3.com/data/comics/220/ta-that-su-khong-phai-la-cai-the-cao-nha-3904.jpg',
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
            ],
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              RatingBarIndicator(
                  rating: 4.5,
                  itemBuilder: (context, index) =>
                      const Icon(Icons.star, color: Colors.amber),
                  itemCount: 5,
                  itemSize: 16,
                  direction: Axis.horizontal),
              const SizedBox(width: 5),
              Text(
                '( 4.5 / 5 )',
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
              'đọc giải trí ổn. tuy nhiên mức độ mọi người thèm ăn có chút lố, ko hay. tu sĩ cao cấp mà định lực ko nổi món ăn cấp thấp. đọc giải trí ổn. tuy nhiên mức độ mọi người thèm ăn có chút lố, ko hay. tu sĩ cao cấp mà định lực ko nổi món ăn cấp thấp..',
              style: GoogleFonts.mulish(
                  color: textColor, fontSize: 13, fontWeight: FontWeight.w300),
              overflow: TextOverflow.ellipsis,
              maxLines: 4,
            ),
          )
        ]),
      );
}
