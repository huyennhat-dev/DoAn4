import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../contains.dart';
import '../utils/button.dart';
import '../widget/nomination_item.dart';
import 'write_nomination.dart';

class VoteBookPage extends StatelessWidget {
  const VoteBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: kTertiaryColor,
        centerTitle: true,
        title: Text(
          'Đánh giá sách',
          style: GoogleFonts.mulish(
              color: textColor, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        actions: [
          ButtonSquare(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WriteNomination())),
              icon: Icon(CupertinoIcons.pencil_outline,
                  color: Colors.white, size: 26),
              bgColor: Colors.transparent),
        ],
        leading: ButtonSquare(
            onPressed: () => Navigator.pop(context),
            icon: Icon(CupertinoIcons.chevron_back,
                color: Colors.white, size: 26),
            bgColor: Colors.transparent),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
            horizontal: kDefautPadding * 1.5, vertical: kDefautPadding / 2),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
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
          ],
        ),
      ),
    );
  }
}
