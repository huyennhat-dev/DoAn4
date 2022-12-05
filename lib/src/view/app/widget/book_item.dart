import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../contains.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key, required this.onPressed});

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: ((390 - 40) / 5) * 4 / 3 + 30,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildItemImage(size,
                'https://st.ntcdntempv3.com/data/comics/35/arrive-the-flower-of-hope-will-bloom-one-2458.jpg'),
            const SizedBox(width: 10),
            _buildItemRight(size),
          ],
        ),
      ),
    );
  }

  Widget _buildItemImage(Size size, String image) => SizedBox(
        width: (390 - 40) / 5,
        height: ((390 - 40) / 5) * 4 / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: CachedNetworkImage(
            imageUrl: image,
            placeholder: (BuildContext context, String url) => Container(
              width: (390 - 40) / 5,
              height: ((390 - 40) / 5) * 4 / 3,
              color: kQuaternaryColor,
            ),
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Container(
                width: (390 - 40) / 5,
                height: ((390 - 40) / 5) * 4 / 3,
                color: kQuaternaryColor),
          ),
        ),
      );

  Widget _buildItemRight(Size size) => Container(
        width: (size.width - 40) / 5 * 4 - 10,
        height: ((390 - 40) / 5) * 4 / 3 + 20,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: (size.width - 40) / 5 * 4 - 10,
              child: Text(
                  'Võ Hiệp: Ở Tiểu Trấn Mở Tửu Quán, Nhặt Thi Sư Phi Huyên',
                  style: GoogleFonts.mulish(
                      color: textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: (size.width - 40) / 5 * 4 - 10,
              child: Text('Tác giả: Sư Phi Huyên',
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
                child: Text('Huyền huyễn',
                    style: GoogleFonts.mulish(
                        color: textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w300)),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.star, color: textColor, size: 16),
              const SizedBox(width: 2),
              Text((5).toInt().toStringAsFixed(1),
                  style: GoogleFonts.mulish(
                      color: textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w300)),
              const SizedBox(width: 10),
              const Icon(Icons.book, color: textColor, size: 16),
              const SizedBox(width: 2),
              Text((10).toString(),
                  style: GoogleFonts.mulish(
                      color: textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w300)),
            ])
          ],
        ),
      );
}
