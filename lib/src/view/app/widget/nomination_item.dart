import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../contains.dart';

class NominationItem extends StatelessWidget {
  const NominationItem(
      {Key? key,
      required this.image,
      required this.content,
      required this.username,
      required this.star,
      required this.heart})
      : super(key: key);

  final String image;
  final String content;
  final String username;
  final double star;
  final int heart;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CachedNetworkImage(
            imageUrl: image,
            imageBuilder: (context, imageProvider) => Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: kButtonColor,
                    borderRadius: BorderRadius.circular(7),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover))),
            placeholder: (context, url) => Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                    color: kButtonColor,
                    borderRadius: BorderRadius.circular(7))),
            errorWidget: (context, url, error) =>
                Icon(Icons.error, color: kErrorColor)),
        const SizedBox(width: 10),
        _buildItemRight(size)
      ],
    );
  }

  Widget _buildItemRight(Size size) => Container(
        width: size.width - 105,
        padding: const EdgeInsets.all(kDefautPadding / 2),
        margin: const EdgeInsets.only(bottom: kDefautPadding / 2),
        decoration: BoxDecoration(
            color: kTertiaryColor, borderRadius: BorderRadius.circular(7)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: size.width - 205 - kDefautPadding,
                        child: Text(username,
                            style: GoogleFonts.mulish(
                                color: textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1),
                      ),
                      const SizedBox(height: 5),
                      RatingBarIndicator(
                          rating: star,
                          itemBuilder: (context, index) =>
                              const Icon(Icons.star, color: Colors.amber),
                          itemCount: 5,
                          itemSize: 14,
                          direction: Axis.horizontal),
                    ]),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: kDefautPadding / 2,
                          vertical: kDefautPadding / 4),
                      decoration: BoxDecoration(
                          color: kButtonColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(children: [
                        Text(heart.toString(),
                            style: GoogleFonts.mulish(
                                color: textColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w400)),
                        const SizedBox(width: 5),
                        Icon(Icons.favorite_border, color: textColor, size: 16)
                      ])),
                )
              ],
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: size.width - 105 - kDefautPadding,
              child: Text(
                content,
                style: GoogleFonts.mulish(
                    color: textColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      );
}
