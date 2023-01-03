import 'package:client/src/view/app/widget/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

import '../../../controller/read_history.dart';
import '../../contains.dart';
import '../utils/button.dart';
import 'book.dart';
import 'components/book_read_item.dart';

class BookRead extends StatefulWidget {
  const BookRead({super.key});

  @override
  State<BookRead> createState() => _BookReadState();
}

class _BookReadState extends State<BookRead> {
  ReadHistoryController controller = Get.put(ReadHistoryController());
  @override
  void initState() {
    controller.getTask();
    controller.paginateTask();
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<ReadHistoryController>();
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
