import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/service.dart';
import '../../../contains.dart';

final String base_Url = Service.base_Url;

class BookForYou extends StatelessWidget {
  const BookForYou({super.key, required this.data});
  final List<dynamic> data;

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
          _buildListBook(context, data, size),
          // _buildHeading('Xem thêm', size, true),
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

  Widget _buildListBook(BuildContext context, List data, Size size) {
    return Container(
        width: size.width - kDefautPadding,
        child: Column(
          children: [
            for (int i = 0; i <= data.length - 1; i++)
              _buildItem(context, data, i, size)
          ],
        ));
  }

  Widget _buildItem(BuildContext context, List data, int i, Size size) =>
      GestureDetector(
        onTap: () => Get.toNamed('/book?id=${data[i].id}'),
        child: Container(
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
                  height: 100 - (kDefautPadding / 3) * 2,
                  imageUrl:
                      '$base_Url/tcv/public/uploads/truyen/' + data[i].hinhanh,
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
                    child: Text('${data[i].tentruyen}',
                        style: GoogleFonts.mulish(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1),
                  ),
                  const SizedBox(height: 3),
                  Text('Chương ${data[i].chuongmoinhat}',
                      style: GoogleFonts.mulish(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1),
                  const SizedBox(height: 3),
                  Text(
                    'Tác giả: ${data[i].tacgia}',
                    style: GoogleFonts.mulish(
                      color: Colors.white,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(height: 3),
                  SizedBox(
                    width: size.width - (kDefautPadding + 90),
                    child: Text(
                      '${data[i].theloai} - ${data[i].thegioi} - ${data[i].tinhcach} - ${data[i].luuphai}m',
                      style: GoogleFonts.mulish(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
