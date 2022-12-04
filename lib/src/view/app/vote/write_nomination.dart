import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../contains.dart';
import '../utils/button.dart';

class WriteNomination extends StatefulWidget {
  const WriteNomination({super.key});

  @override
  State<WriteNomination> createState() => _WriteNominationState();
}

class _WriteNominationState extends State<WriteNomination> {
  final TextEditingController contentController = TextEditingController();

  var rate;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        toolbarHeight: 50,
        elevation: 0,
        backgroundColor: kTertiaryColor,
        centerTitle: true,
        title: Text(
          'Viết đề cử',
          style: GoogleFonts.mulish(
              color: textColor, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        leading: ButtonSquare(
            onPressed: () => Navigator.pop(context),
            icon: Icon(CupertinoIcons.chevron_back,
                color: Colors.white, size: 26),
            bgColor: Colors.transparent),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            // _buildPageHeader(),
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: ((size.width) - 60) / 2,
                        child: Text(
                          "Đánh giá truyện",
                          style: GoogleFonts.mulish(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: 1,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        unratedColor: textColor,
                        itemSize: 26,
                        itemBuilder: (context, _) =>
                            const Icon(Icons.star, color: Colors.amber),
                        onRatingUpdate: (rating) {
                          rate = rating;
                        },
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: ((size.width) - 40) / 2,
                    child: Text(
                      "Viết nội dung đánh giá",
                      style: GoogleFonts.mulish(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: size.height / 2,
                    padding: const EdgeInsets.all(kDefautPadding / 2),
                    decoration: BoxDecoration(
                        color: kQuaternaryColor.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(7)),
                    child: TextFormField(
                      maxLength: 250,
                      controller: contentController,
                      cursorColor: textColor,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      style: GoogleFonts.mulish(
                          color: textColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400),
                      decoration: InputDecoration(
                          counterStyle: TextStyle(color: textColor),
                          hintStyle: GoogleFonts.mulish(
                              color: textColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: "Viết đánh giá...",
                          contentPadding: const EdgeInsets.all(0)),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: SizedBox(
                      width: 100,
                      child: ButtonCus(
                          bgColor: kSecondaryColor,
                          fontSize: 18,
                          onPressed: () {},
                          text: 'Đăng',
                          textColor: textColor),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
