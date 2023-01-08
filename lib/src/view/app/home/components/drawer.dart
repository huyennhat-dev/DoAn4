import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../services/service.dart';
import '../../../contains.dart';
import '../../book/book_read.dart';
import '../../book/bookcase.dart';
import '../../utils/button.dart';
import '../../utils/heading.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefautPadding / 2),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            _buildTopDrawer(context),
            // _buildBookStatus(),
            // _buildBookCategory(),
            // AppHeading(
            //     title: 'Mới cập nhật',
            //     onPressed: () {},
            //     status: true,
            //     icon: Icon(Icons.book, color: Colors.white, size: 22)),
            uid.isNotEmpty
                ? AppHeading(
                    title: 'Sách đang theo dõi',
                    onPressed: () => Get.toNamed('/case-book'),
                    status: true,
                    icon: Icon(CupertinoIcons.bookmark_fill,
                        color: Colors.white, size: 20))
                : SizedBox(),
            uid.isNotEmpty
                ? AppHeading(
                    title: 'Sách đã đọc',
                    onPressed: () => Get.toNamed('/read-book'),
                    status: true,
                    icon: Icon(CupertinoIcons.book_fill,
                        color: Colors.white, size: 20))
                : SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _buildTopDrawer(BuildContext context) => Row(
        children: [
          ButtonSquare(
            onPressed: () => Scaffold.of(context).closeDrawer(),
            icon: Icon(CupertinoIcons.chevron_back,
                color: Colors.white, size: 26),
            bgColor: Colors.transparent,
          ),
          const SizedBox(width: 10),
          Container(
            child: Text(
              Service.appFirstName,
              style: GoogleFonts.permanentMarker(
                  color: kSecondaryColor, fontSize: 28),
            ),
          ),
          Container(
            child: Text(
              Service.appLastName,
              style: GoogleFonts.permanentMarker(
                  color: Colors.white, fontSize: 28),
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/image/logo-w.png'),
              fit: BoxFit.cover,
            )),
          ),
        ],
      );

  Widget _buildBookStatus() => Container(
        padding: const EdgeInsets.symmetric(vertical: kDefautPadding / 2),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    width: 1.5, color: Colors.white12.withOpacity(0.3)))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppHeading(
              title: 'Trạng thái sách',
              onPressed: () {},
              icon: Icon(Icons.nature),
            ),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              children: [
                DrawerItem(onPressed: () {}, text: 'Đang tiến hành'),
                DrawerItem(onPressed: () {}, text: 'Hoàn thành'),
                DrawerItem(onPressed: () {}, text: 'Tạm ngưng'),
              ],
            )
          ],
        ),
      );

  Widget _buildBookCategory() => Container(
        padding: const EdgeInsets.symmetric(vertical: kDefautPadding / 2),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
          width: 1.5,
          color: Colors.white12.withOpacity(0.3),
        ))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppHeading(
              title: 'Thể loại',
              onPressed: () {},
              icon: Icon(Icons.nature),
            ),
            Wrap(
              spacing: 5,
              runSpacing: 5,
              direction: Axis.horizontal,
              alignment: WrapAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                DrawerItem(onPressed: () {}, text: 'Cạnh Kỹ'),
                DrawerItem(onPressed: () {}, text: 'Huyền Huyễn'),
                DrawerItem(onPressed: () {}, text: 'Huyền Nghi'),
                DrawerItem(onPressed: () {}, text: 'Khoa Huyễn'),
                DrawerItem(onPressed: () {}, text: 'Kiếm Hiệp'),
                DrawerItem(onPressed: () {}, text: 'Kỳ Ảo'),
                DrawerItem(onPressed: () {}, text: 'Lịch Sử'),
                DrawerItem(onPressed: () {}, text: 'Tiên Hiệp'),
                DrawerItem(onPressed: () {}, text: 'Võng du'),
                DrawerItem(onPressed: () {}, text: 'Đô thị'),
                DrawerItem(onPressed: () {}, text: 'Đồng nhân'),
              ],
            )
          ],
        ),
      );
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: kDefautPadding / 2, vertical: kDefautPadding / 4),
          child: Text(text,
              style: GoogleFonts.mulish(
                  color: textColor, fontSize: 14, fontWeight: FontWeight.w400)),
        ),
      );
}
