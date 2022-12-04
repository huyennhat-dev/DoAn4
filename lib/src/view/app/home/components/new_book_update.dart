import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

class NewBookUpdate extends StatefulWidget {
  const NewBookUpdate({super.key});

  @override
  State<NewBookUpdate> createState() => _NewBookUpdateState();
}

class _NewBookUpdateState extends State<NewBookUpdate> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: kDefautPadding / 2, horizontal: kDefautPadding / 2),
      child: Column(
        children: [
          AppHeading(
              title: 'Mới cập nhật',
              status: true,
              onPressed: () {},
              icon: Icon(CupertinoIcons.chevron_right,
                  color: Colors.white, size: 20)),
          Container(
            width: size.width - kDefautPadding,
            height: 202,
            child: ScrollConfiguration(
              behavior: MyBehavior(),
              child: ListView.builder(
                  itemCount: imgList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) =>
                      _buildItem(index)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem(int index) => GestureDetector(
        onTap: () {
          print(index);
        },
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: imgList[index],
                  imageBuilder: (context, imageProvider) => Container(
                    margin: index == imgList.length - 1
                        ? const EdgeInsets.only(right: 0)
                        : const EdgeInsets.only(right: 10),
                    height: 160,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                          image: NetworkImage(imgList[index]),
                          fit: BoxFit.cover),
                    ),
                  ),
                  placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(
                          strokeWidth: 1.5, color: kSecondaryColor)),
                  errorWidget: (context, url, error) =>
                      Center(child: Icon(Icons.error, color: kErrorColor)),
                ),
                Positioned(
                  top: 5,
                  left: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        color: Colors.black.withOpacity(0.1),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: kDefautPadding / 3,
                            vertical: kDefautPadding / 4),
                        child: Text(
                          'Chương 400',
                          style: GoogleFonts.mulish(
                              color: textColor,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 120,
              child: Text(
                'Tầm Trảo Tiền Thế Chi Lữ 2',
                style: GoogleFonts.mulish(
                    color: textColor,
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            )
          ],
        ),
      );
}
