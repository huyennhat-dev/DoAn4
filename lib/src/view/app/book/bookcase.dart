import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../contains.dart';
import '../utils/button.dart';
import '../widget/book_item.dart';

class BookCase extends StatelessWidget {
  const BookCase({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: kTertiaryColor,
        centerTitle: true,
        title: Text(
          'Sách đang theo dõi',
          style: GoogleFonts.mulish(
              color: textColor, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        leading: ButtonSquare(
            onPressed: () => Navigator.pop(context),
            icon: Icon(CupertinoIcons.chevron_back,
                color: Colors.white, size: 26),
            bgColor: Colors.transparent),
      ),
      backgroundColor: kPrimaryColor,
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 20),
        itemCount: 10,
        itemBuilder: (_, index) => BookItem(
          onPressed: () {},
        ),
      ),
    );
  }
}
