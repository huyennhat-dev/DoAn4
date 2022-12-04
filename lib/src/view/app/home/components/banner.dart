import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:client/src/services/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:http/http.dart' as http;

import '../../../../model/banner.dart';
import '../../../contains.dart';
import '../../book/book.dart';
import '../../chapter/chapter.dart';
import '../../utils/button.dart';

final String base_Url = Service.base_Url;
Future<List<BannerModel>> fetchNominations() async {
  final response =
      await http.get(Uri.parse('$base_Url/tcv/public/api/v2/banner'));
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => BannerModel.fromJson(data)).toList();
  } else {
    throw Exception('Có lỗi rồi!');
  }
}

class AppBanner extends StatefulWidget {
  const AppBanner({super.key});

  @override
  State<AppBanner> createState() => _AppBannerState();
}

class _AppBannerState extends State<AppBanner> {
  int activateIndex = 0;

  late Future<List<BannerModel>> futureNominations;

  @override
  void initState() {
    super.initState();
    futureNominations = fetchNominations();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FutureBuilder<List<BannerModel>>(
          future: futureNominations,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return CarouselSlider.builder(
                itemCount: snapshot.data!.length,
                options: CarouselOptions(
                  height: size.width * 0.65,
                  autoPlay: true,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlayInterval: const Duration(milliseconds: 7000),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  onPageChanged: (index, reason) => setState(
                    () => activateIndex = index,
                  ),
                ),
                itemBuilder: (context, index, realIndex) {
                  return _buildImage(context, snapshot.data![index], size);
                },
              );
            }
            return Container(
                width: size.width,
                height: size.width * 0.65,
                color: kButtonColor);
          },
        ),
      ],
    );
  }

  Widget _buildImage(BuildContext context, data, Size size) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: Container(
          height: 260,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    '$base_Url/tcv/public/uploads/truyen/' + data.hinhanh),
                fit: BoxFit.cover),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: kDefautPadding / 2,
                  vertical: kDefautPadding * 1.5),
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.4)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildBannerLeft(context, data, size),
                  _buildBannerRight(
                      '$base_Url/tcv/public/uploads/truyen/' + data.hinhanh,
                      size)
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildBannerLeft(BuildContext context, data, Size size) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Chương ${data.chuongmoinhat}',
            style: GoogleFonts.mulish(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 5),
          SizedBox(
            width: (size.width - kDefautPadding) -
                size.width / 3 -
                kDefautPadding / 2,
            child: Text(
              data.tentruyen,
              style: GoogleFonts.mulish(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ),
          SizedBox(
            width: (size.width - kDefautPadding) -
                size.width / 3 -
                kDefautPadding / 2,
            child: Html(
              data: data.mota,
              style: {
                "body": Style(
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.all(0),
                    fontSize: FontSize(14.0),
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Mulish',
                    textOverflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    color: textColor,
                    wordSpacing: 2),
              },
            ),
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ButtonCus(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookChapter(
                              truyen_id: data.id,
                              slugChuong: data.chuongmoinhat))),
                  text: 'Đọc ngay',
                  bgColor: kSecondaryColor,
                  textColor: Colors.white,
                  fontSize: 14),
              const SizedBox(width: 15),
              ButtonCus(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => BookPage(truyen_id: data.id))),
                  text: 'Chi tiết',
                  bgColor: Colors.white,
                  textColor: Colors.black,
                  fontSize: 14)
            ],
          )
        ],
      );

  Widget _buildBannerRight(String image, Size size) => SizedBox(
        width: size.width / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: image,
            placeholder: (BuildContext context, String url) => Container(
              width: size.width / 3,
              height: (size.width / 3) * (4 / 3),
              color: kQuaternaryColor,
            ),
            fit: BoxFit.fitHeight,
          ),
        ),
      );
}
