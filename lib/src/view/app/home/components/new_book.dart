import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/service.dart';
import '../../../contains.dart';
import '../../utils/heading.dart';

final String base_Url = Service.base_Url;

class NewBook extends StatelessWidget {
  const NewBook({super.key, required this.data});
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
              title: 'Sách mới',
              status: true,
              onPressed: () {},
              icon: Icon(CupertinoIcons.chevron_right,
                  color: Colors.white, size: 20)),
          Container(
            width: size.width - kDefautPadding,
            height: 210,
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
                  placeholder: (context, url) => ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Container(
                      width: 120,
                      height: 160,
                      color: kQuaternaryColor,
                    ),
                  ),
                  errorWidget: (context, url, error) => ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: Container(
                      width: 120,
                      height: 160,
                      color: kQuaternaryColor,
                    ),
                  ),
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
                          'Chương ${data[index].chuongmoinhat}',
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
                "${data[index].tentruyen}",
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
