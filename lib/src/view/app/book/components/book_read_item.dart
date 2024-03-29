import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/src/model/lib_book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/service.dart';
import '../../../contains.dart';

final String base_Url = Service.base_Url;

class BookReadItem extends StatelessWidget {
  const BookReadItem({super.key, required this.data, required this.onDelete});

  final BookLibrary data;
  final VoidCallback onDelete;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () => Get.toNamed('/book?id=${data.truyenId}'),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: kDefautPadding / 2, vertical: kDefautPadding / 2),
        margin: const EdgeInsets.only(
            top: kDefautPadding / 2,
            left: kDefautPadding / 2,
            right: kDefautPadding / 2),
        decoration: BoxDecoration(
          color: kTertiaryColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildItemImage(size),
            const SizedBox(width: 10),
            _buildItemRight(context, size),
          ],
        ),
      ),
    );
  }

  Widget _buildItemImage(Size size) => SizedBox(
        width: 70,
        height: 70 * 4 / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: CachedNetworkImage(
            imageUrl: '$base_Url/tcv/public/uploads/truyen/${data.hinhanh}',
            placeholder: (BuildContext context, String url) => Container(
                height: 70 * 4 / 3, width: 70, color: kQuaternaryColor),
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Container(
                height: 70 * 4 / 3, width: 70, color: kQuaternaryColor),
          ),
        ),
      );

  Widget _buildItemRight(BuildContext context, Size size) => Container(
        width: (size.width - kDefautPadding * 2) - 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: (size.width - 40) - 110,
                  child: Text('${data.tentruyen}',
                      style: GoogleFonts.mulish(
                          color: textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2),
                ),
                SizedBox(
                  width: 30,
                  height: 30,
                  child: Theme(
                    data: Theme.of(context).copyWith(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent),
                    child: PopupMenuButton(
                      color: Colors.white,
                      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                        PopupMenuItem(
                          child: Text('Xóa khỏi tủ truyện'),
                          height: 30,
                          onTap: onDelete,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: (size.width - 40) - 110,
              child: Text('Tác giả: ${data.tacgia}',
                  style: GoogleFonts.mulish(
                      color: textColor,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
            ),
            const SizedBox(height: 5),
            Row(children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefautPadding / 2,
                    vertical: kDefautPadding / 7),
                decoration: BoxDecoration(
                    border: Border.all(color: kSecondaryColor, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: Text('${data.theloai}',
                    style: GoogleFonts.mulish(
                        color: textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w300)),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.book, color: textColor, size: 16),
              const SizedBox(width: 2),
              Text('${data.chuongSlug} / ${data.tongsochuong}',
                  style: GoogleFonts.mulish(
                      color: textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w300)),
            ])
          ],
        ),
      );
}
