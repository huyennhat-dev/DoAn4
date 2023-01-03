import 'package:client/src/controller/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../model/decu.dart';
import '../../../../services/service.dart';
import '../../../contains.dart';
import '../../utils/heading.dart';
import '../../vote/vote.dart';
import '../../vote/write_nomination.dart';
import '../../widget/nomination_item.dart';

final String base_Url = Service.base_Url;

class Nominations extends StatefulWidget {
  const Nominations(
      {super.key, required this.uid, required this.bookController});

  final uid;

  final BookController bookController;

  @override
  State<Nominations> createState() => _NominationsState();
}

class _NominationsState extends State<Nominations> {
  void onDel(id) => widget.bookController.delRating(id);

  void onHeart() {}
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
                          builder: (context) => WriteNomination(
                              truyen_id: widget.bookController.book!.id!))),
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
                widget.bookController.topdecus.length < 1
                    ? Container(
                        padding: const EdgeInsets.all(kDefautPadding / 2),
                        decoration: BoxDecoration(
                            color: kTertiaryColor,
                            borderRadius: BorderRadius.circular(7)),
                        child: Center(
                          child: Text('Không có đề cử nào cả',
                              style: GoogleFonts.mulish(
                                  color: textColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                        ),
                      )
                    : Column(children: [
                        for (int i = 0;
                            i <= widget.bookController.topdecus.length - 1;
                            i++)
                          NominationItem(
                            onHandel: widget.uid ==
                                    widget.bookController.topdecus[i].uid
                                ? () => onDel(
                                    widget.bookController.topdecus[i].rateid)
                                : () => onHeart,
                            image: '$base_Url/tcv/public/uploads/cus_avt/' +
                                widget.bookController.topdecus[i].photo!,
                            content: widget.bookController.topdecus[i].content!,
                            username:
                                widget.bookController.topdecus[i].username!,
                            star: widget.bookController.topdecus[i].sosao!,
                            heart: 10,
                            isMe: widget.uid ==
                                widget.bookController.topdecus[i].uid,
                          ),
                        widget.bookController.topdecus.length >= 3
                            ? Center(
                                child: GestureDetector(
                                  onTap: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VoteBookPage())),
                                  child: Container(
                                    width: 130,
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: kDefautPadding / 5,
                                        horizontal: kDefautPadding / 1),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: kSecondaryColor),
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("Xem thêm",
                                            style: GoogleFonts.mulish(
                                                color: kSecondaryColor,
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14)),
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
                            : SizedBox(),
                      ])
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
