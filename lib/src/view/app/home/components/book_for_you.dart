import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../contains.dart';

final List<String> imgList = [
  'https://st.ntcdntempv3.com/data/comics/113/mairimashita-iruma-kun.jpg',
  'https://st.ntcdntempv3.com/data/comics/42/komi-khong-the-giao-tiep.jpg',
  'https://st.ntcdntempv3.com/data/comics/70/dan-anh-xau-xa.jpg',
  'https://st.ntcdntempv3.com/data/comics/78/yofukashi-no-uta.jpg',
  'https://st.ntcdntempv3.com/data/comics/113/mairimashita-iruma-kun.jpg',
  'https://st.ntcdntempv3.com/data/comics/42/komi-khong-the-giao-tiep.jpg',
  'https://st.ntcdntempv3.com/data/comics/70/dan-anh-xau-xa.jpg',
  'https://st.ntcdntempv3.com/data/comics/78/yofukashi-no-uta.jpg',
  'https://st.ntcdntempv3.com/data/comics/113/mairimashita-iruma-kun.jpg'
];

class BookForYou extends StatelessWidget {
  const BookForYou({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kDefautPadding / 2),
      margin: const EdgeInsets.only(top: kDefautPadding * 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildHeading('Có thể bạn sẽ muốn đọc', size, false),
          _buildListBook(size),
          _buildHeading('Xem thêm', size, true),
        ],
      ),
    );
  }

  Widget _buildHeading(String title, Size size, bool status) => GestureDetector(
        onTap: status ? () {} : null,
        child: Container(
          width: size.width - kDefautPadding,
          padding: const EdgeInsets.symmetric(vertical: kDefautPadding / 2),
          decoration: BoxDecoration(
            color: kTertiaryColor,
            borderRadius: !status
                ? BorderRadius.only(
                    topLeft: Radius.circular(7),
                    topRight: Radius.circular(7),
                  )
                : BorderRadius.only(
                    bottomLeft: Radius.circular(7),
                    bottomRight: Radius.circular(7),
                  ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.mulish(
                    color: status ? Colors.white : kSecondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(width: 5),
              status
                  ? Icon(CupertinoIcons.chevron_right,
                      color: Colors.white, size: 20)
                  : SizedBox()
            ],
          ),
        ),
      );

  Widget _buildListBook(Size size) => Container(
        width: size.width - kDefautPadding,
        child: Column(
          children: [
            for (int i = 0; i <= imgList.length - 1; i++) _buildItem(i, size)
          ],
        ),
      );

  Widget _buildItem(int i, Size size) => Container(
        height: 100,
        width: size.width - kDefautPadding,
        color: i % 2 == 0 ? kQuaternaryColor : kTertiaryColor,
        padding: EdgeInsets.all(kDefautPadding / 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(7),
              child: CachedNetworkImage(
                imageUrl: imgList[i],
                placeholder: (BuildContext context, String url) => ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: Container(
                    width: (100 - (kDefautPadding / 3) * 2) * (3 / 4),
                    height: 100 - (kDefautPadding / 3) * 2,
                    color: kQuaternaryColor,
                  ),
                ),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width - (kDefautPadding + 90),
                  child: Text(
                    'Đảo hải tặc có một không hai trên thế giới',
                    style: GoogleFonts.mulish(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Chương 1080',
                  style: GoogleFonts.mulish(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: size.width - (kDefautPadding + 90),
                  child: Text(
                    'Action - Drama - Manga - Romance - School Life - Trinh thám',
                    style: GoogleFonts.mulish(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
