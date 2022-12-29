import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../contains.dart';
import '../../utils/button.dart';

class BookChapterHeader extends StatelessWidget {
  const BookChapterHeader(
      {super.key, required this.chapterName, required this.onPressed});

  final String chapterName;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: 50,
      color: kTertiaryColor,
      padding: const EdgeInsets.symmetric(
          horizontal: kDefautPadding / 4, vertical: kDefautPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ButtonSquare(
                onPressed: () => Navigator.pop(context),
                icon: Icon(CupertinoIcons.chevron_back,
                    color: Colors.white, size: 26),
                bgColor: Colors.transparent,
              ),
              const SizedBox(width: 10),
              Container(
                width: size.width - (kDefautPadding + 90),
                height: 40,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefautPadding / 4,
                    vertical: kDefautPadding / 4),
                decoration: BoxDecoration(
                    color: kButtonColor,
                    borderRadius: BorderRadius.circular(7)),
                child: Text(
                  chapterName,
                  style: GoogleFonts.mulish(
                      color: textColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              )
            ],
          ),
          ButtonSquare(
            onPressed: onPressed,
            icon: Icon(Icons.settings, color: Colors.white, size: 20),
            bgColor: kButtonColor,
          )
        ],
      ),
    );
  }
}
