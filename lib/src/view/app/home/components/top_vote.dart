import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/service.dart';
import '../../../contains.dart';
import '../../book/book.dart';
import '../../utils/heading.dart';

final String base_Url = Service.base_Url;

class TopVote extends StatelessWidget {
  const TopVote({super.key, required this.data});

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
                  itemCount: data.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, index) =>
                      _buildItem(context, data, index)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, List data, int index) =>
      GestureDetector(
        onTap: () => Get.toNamed('/book?id=${data[index].id}'),
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: '$base_Url/tcv/public/uploads/truyen/' +
                      data[index].hinhanh,
                  imageBuilder: (context, imageProvider) => Container(
                    margin: index == data.length - 1
                        ? const EdgeInsets.only(right: 0)
                        : const EdgeInsets.only(right: 10),
                    height: 160,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      image: DecorationImage(
                          image: NetworkImage(
                              '$base_Url/tcv/public/uploads/truyen/' +
                                  data[index].hinhanh),
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
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              topLeft: Radius.circular(7)),
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
                          '#${index + 1} ${data[index].tentruyen}',
                          style: GoogleFonts.mulish(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              topLeft: Radius.circular(7)),
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
                          '#${index + 1}  ${data[index].tentruyen}',
                          style: GoogleFonts.mulish(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              topLeft: Radius.circular(7)),
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
                          '#${index + 1}  ${data[index].tentruyen}',
                          style: GoogleFonts.mulish(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(7),
                              topLeft: Radius.circular(7)),
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
                          '#${index + 1}  ${data[index].tentruyen}',
                          style: GoogleFonts.mulish(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
