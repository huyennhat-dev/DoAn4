import 'package:client/src/controller/search.dart';
import 'package:client/src/view/app/widget/loading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../contains.dart';
import '../utils/button.dart';
import 'components/book_item.dart';

class SearchBookPage extends StatefulWidget {
  const SearchBookPage({super.key});

  @override
  State<SearchBookPage> createState() => _SearchBookPageState();
}

class _SearchBookPageState extends State<SearchBookPage> {
  SearchBookController controller = Get.put(SearchBookController());

  String val = '';
  bool suffixStatus = false;

  @override
  void initState() {
    Get.delete<SearchBookController>();

    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SearchBookController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
          elevation: 0, toolbarHeight: 0, backgroundColor: kPrimaryColor),
      body: Column(
        children: [
          _buildSearchPageHeader(size),
          Expanded(
              flex: 1,
              child: Obx(() {
                if (controller.isloading.value)
                  return Container(
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: kDefautPadding * 2),
                    child: LoadingWidget(message: 'Loading...'),
                  );
                if (controller.books.length < 1) return Container();

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.only(bottom: 20),
                  itemCount: controller.books.length,
                  itemBuilder: (_, index) => BookItem(
                    data: controller.books[index],
                  ),
                );
              }))
        ],
      ),
    );
  }

  Widget _buildSearchPageHeader(Size size) => Container(
        height: 50,
        width: size.width,
        color: kTertiaryColor,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
            horizontal: kDefautPadding / 2, vertical: kDefautPadding / 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ButtonSquare(
              onPressed: () => Navigator.pop(context),
              icon: Icon(CupertinoIcons.chevron_back,
                  color: Colors.white, size: 26),
              bgColor: Colors.transparent,
            ),
            const SizedBox(width: 10),
            Container(
              height: 40,
              width: (size.width - kDefautPadding - 60),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7), color: kButtonColor),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              margin: const EdgeInsets.only(right: 10),
              child: Row(
                children: [
                  SizedBox(
                    width: (size.width - 100) * 0.1,
                    child: const Icon(CupertinoIcons.search,
                        color: textColor, size: 24),
                  ),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: (size.width - 100) * 0.9 - 5,
                    child: TextFormField(
                      controller: controller.textController,
                      cursorColor: textColor,
                      style: GoogleFonts.mulish(
                          color: textColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                      maxLines: 1,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                          suffixIcon: suffixStatus
                              ? GestureDetector(
                                  onTap: () {
                                    controller.textController.clear();
                                    setState(() => suffixStatus = false);
                                    controller
                                        .getBook(controller.textController);
                                  },
                                  child: Icon(Icons.close,
                                      color: kSecondaryColor, size: 20))
                              : null,
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.mulish(
                              color: textColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                          hintText: "Tìm truyện theo tên, tác giả...",
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 11, horizontal: 0)),
                      onChanged: (value) {
                        if (value.length > 0 && !suffixStatus)
                          setState(() => suffixStatus = !suffixStatus);

                        if (value.length == 0 && suffixStatus)
                          setState(() => suffixStatus = false);

                        controller.getBook(value.trim());
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
