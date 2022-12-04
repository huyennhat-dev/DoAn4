import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../contains.dart';
import '../../utils/heading.dart';
import '../../vote/vote.dart';
import '../../vote/write_nomination.dart';
import '../../widget/nomination_item.dart';

class Nominations extends StatelessWidget {
  const Nominations({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(
          horizontal: kDefautPadding / 1, vertical: kDefautPadding / 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AppHeading(
              title: 'Đề cử',
              onPressed: () => null,
              status: true,
              icon: Icon(Icons.trending_up, color: Colors.white, size: 20)),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(kDefautPadding / 2),
            decoration: BoxDecoration(
                color: kButtonColor, borderRadius: BorderRadius.circular(7)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => WriteNomination())),
                  child: _buildNominationButton(),
                ),
                Divider(color: kTertiaryColor),
                SizedBox(
                    child: Text('Đề cử gần đây',
                        style: GoogleFonts.mulish(
                            color: textColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400))),
                const SizedBox(height: 10),
                Column(children: [
                  NominationItem(
                      image:
                          'https://i.pinimg.com/736x/b7/26/73/b72673d3ac44516defb82adea9edb909.jpg',
                      content:
                          'Ai chê thì chê chứ riêng nói bộ này siêu phẩm cũng ko đủ bối cảnh võ lâm trung nguyên cũng khác bọt thế giới tu chân và quan trọng là hệ thống này thật sự đặc biệt quá nhiều cách để khai thác hơn hết nhiều bộ cũng là tuổi thơ của biết bao nhiêu người tác chỉ biến tấu nhẹ vì đây là thế giới khác vừa lạ vừa quen tóm lại rất hay hi vọng convert cố gắng ^^',
                      username: 'Trần Ngọc Phong',
                      star: 4.0,
                      heart: 50),
                  NominationItem(
                      image:
                          'https://i.pinimg.com/736x/b7/26/73/b72673d3ac44516defb82adea9edb909.jpg',
                      content:
                          'Ai chê thì chê chứ riêng nói bộ này siêu phẩm cũng ko đủ bối cảnh võ lâm trung nguyên cũng khác bọt thế giới tu chân và quan trọng là hệ thống này thật sự đặc biệt quá nhiều cách để khai thác hơn hết nhiều bộ cũng là tuổi thơ của biết bao nhiêu người tác chỉ biến tấu nhẹ vì đây là thế giới khác vừa lạ vừa quen tóm lại rất hay hi vọng convert cố gắng ^^',
                      username: 'Trần Ngọc Phong',
                      star: 4.0,
                      heart: 50),
                  NominationItem(
                      image:
                          'https://i.pinimg.com/736x/b7/26/73/b72673d3ac44516defb82adea9edb909.jpg',
                      content:
                          'Ai chê thì chê chứ riêng nói bộ này siêu phẩm cũng ko đủ bối cảnh võ lâm trung nguyên cũng khác bọt thế giới tu chân và quan trọng là hệ thống này thật sự đặc biệt quá nhiều cách để khai thác hơn hết nhiều bộ cũng là tuổi thơ của biết bao nhiêu người tác chỉ biến tấu nhẹ vì đây là thế giới khác vừa lạ vừa quen tóm lại rất hay hi vọng convert cố gắng ^^',
                      username: 'Trần Ngọc Phong',
                      star: 4.0,
                      heart: 50),
                ]),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => VoteBookPage())),
                    child: Container(
                      width: 130,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefautPadding / 5,
                          horizontal: kDefautPadding / 1),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1, color: kSecondaryColor),
                          borderRadius: BorderRadius.circular(7)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Xem thêm",
                            style: GoogleFonts.mulish(
                                color: kSecondaryColor,
                                fontWeight: FontWeight.w500,
                                fontSize: 14),
                          ),
                          const SizedBox(width: 5),
                          Icon(
                              size: 14,
                              color: Colors.white,
                              CupertinoIcons.chevron_right)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNominationButton() => Container(
        padding: const EdgeInsets.all(kDefautPadding / 2),
        decoration: BoxDecoration(
            color: kTertiaryColor, borderRadius: BorderRadius.circular(7)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(CupertinoIcons.pencil_outline, color: textColor, size: 20),
            const SizedBox(width: 5),
            Text('Viết đề cử',
                style: GoogleFonts.mulish(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      );
}
