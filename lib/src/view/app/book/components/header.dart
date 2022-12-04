import 'package:client/src/view/contains.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/button.dart';

class BookPageHeader extends StatelessWidget {
  const BookPageHeader({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: const EdgeInsets.only(
          top: kDefautPadding / 1.5, left: kDefautPadding / 1.5),
      child: ButtonSquare(
        onPressed: onPressed,
        icon: Icon(
          CupertinoIcons.chevron_back,
          color: Colors.white,
          size: 26,
        ),
        bgColor: Colors.black.withOpacity(0.35),
      ),
    );
  }
}
