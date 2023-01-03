import 'package:client/src/controller/book_mark.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../contains.dart';
import '../utils/button.dart';
import '../widget/book_item.dart';
import '../widget/loading.dart';
import 'components/book_read_item.dart';

class BookCase extends StatefulWidget {
  const BookCase({super.key});

  @override
  State<BookCase> createState() => _BookCaseState();
}

class _BookCaseState extends State<BookCase> {
  BookMarkController controller = Get.put(BookMarkController());
  @override
  void initState() {
    controller.getTask();
    controller.paginateTask();
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<BookMarkController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: kTertiaryColor,
        centerTitle: true,
        title: Text(
          'Sách đã đọc',
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
      body: Obx(() => controller.isloading.value
          ? Container(
              color: kPrimaryColor,
              height: MediaQuery.of(context).size.height - 50,
              padding:
                  const EdgeInsets.symmetric(horizontal: kDefautPadding * 2),
              alignment: Alignment.center,
              child: LoadingWidget(message: 'Loading...'))
          : LazyLoadScrollView(
              isLoading: controller.isMoreDataAvailable.value,
              onEndOfPage: controller.paginateTask,
              child: ListView.builder(
                controller: controller.scrollController,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(bottom: 20),
                itemCount: controller.books.length,
                itemBuilder: (_, index) => BookReadItem(
                  data: controller.books[index],
                  onDelete: () =>
                      controller.delBook(controller.books[index].id),
                ),
              ),
            )),
    );
  }
}
