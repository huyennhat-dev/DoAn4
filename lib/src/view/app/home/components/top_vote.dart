import 'package:cached_network_image/cached_network_image.dart';
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

class TopVote extends StatelessWidget {
  const TopVote({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(
          vertical: kDefautPadding / 2, horizontal: kDefautPadding / 2),
      child: Column(
        children: [
          AppHeading(
              title: 'Cộng đồng bình chọn',
              status: true,
              onPressed: () {},
              icon: Icon(Icons.trending_up, color: Colors.white, size: 20)),
          Container(
            width: size.width - kDefautPadding,
            height: 160,
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
                if (index == 0)
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 35,
                      height: 160,
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefautPadding / 2),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        stops: [0.0, 1.0],
                        colors: [
                          Color(0xFFFFD700).withOpacity(1.0),
                          Color(0xFFFFD700).withOpacity(0.25)
                        ],
                      )),
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          '#${index + 1} Đảo hải tặc',
                          style: GoogleFonts.mulish(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                if (index == 1)
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 35,
                      height: 160,
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefautPadding / 2),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        stops: [0.0, 1.0],
                        colors: [
                          Color(0xFFC0C0C0).withOpacity(1.0),
                          Color(0xFFC0C0C0).withOpacity(0.25)
                        ],
                      )),
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          '#${index + 1} Đảo hải tặc',
                          style: GoogleFonts.mulish(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                if (index == 2)
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 35,
                      height: 160,
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefautPadding / 2),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        stops: [0.0, 1.0],
                        colors: [
                          Color(0xFFCD7F32).withOpacity(1.0),
                          Color(0xFFCD7F32).withOpacity(0.25)
                        ],
                      )),
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          '#${index + 1} Đảo hải tặc',
                          style: GoogleFonts.mulish(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                if (index != 0 && index != 1 && index != 2)
                  Positioned(
                    top: 0,
                    child: Container(
                      width: 35,
                      height: 160,
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefautPadding / 2),
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        stops: [0.0, 1.0],
                        colors: [
                          Color(0xFF3F3C36).withOpacity(1.0),
                          Color(0xFF3F3C36).withOpacity(0.25)
                        ],
                      )),
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: Text(
                          '#${index + 1} Đảo hải tặc',
                          style: GoogleFonts.mulish(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  )
              ],
            ),
          ],
        ),
      );
}