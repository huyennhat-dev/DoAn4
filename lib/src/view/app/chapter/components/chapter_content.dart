import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import '../../../contains.dart';

class BookChapterContent extends StatelessWidget {
  const BookChapterContent({super.key, required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      constraints: BoxConstraints.expand(),
      color: kPrimaryColor,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefautPadding / 4),
            child: Html(
              data: content,
              style: {
                "body": Style(
                    fontSize: FontSize(16.0),
                    fontWeight: FontWeight.w300,
                    fontFamily: 'Mulish',
                    color: textColor,
                    wordSpacing: 2),
              },
            ),
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }
}
