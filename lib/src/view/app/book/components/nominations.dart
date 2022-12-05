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

class Nominations extends StatelessWidget {
  const Nominations({super.key, required this.decus});

  final List<Topdecu> decus;

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
                decus.length < 1
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
                        for (int i = 0; i <= decus.length - 1; i++)
                          NominationItem(
                              image: '$base_Url/tcv/public/uploads/cus_avt/' +
                                  decus[i].photo!,
                              content: decus[i].content!,
                              username: decus[i].username!,
                              star: decus[i].sosao!,
                              heart: 10),
                        decus.length >= 3
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
