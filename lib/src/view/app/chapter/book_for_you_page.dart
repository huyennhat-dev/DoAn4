import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/src/controller/book_for_you.dart';
import 'package:client/src/services/service.dart';
import 'package:client/src/view/app/widget/loading.dart';
import 'package:client/src/view/contains.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import '../utils/button.dart';

final String base_Url = Service.base_Url;
final oCcy = NumberFormat.compact();

class BookForYouPage extends StatefulWidget {
  const BookForYouPage({super.key});

  @override
  State<BookForYouPage> createState() => _BookForYouPageState();
}

class _BookForYouPageState extends State<BookForYouPage> {
  BookForYouController controller = Get.put(BookForYouController());
  @override
  void initState() {
    Get.delete<BookForYouController>();

    controller.fetchData(Get.arguments['truyen_id']);
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<BookForYouController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: kTertiaryColor,
        centerTitle: true,
        title: Text(
          'Đề cử đọc',
          style: GoogleFonts.mulish(
              color: textColor, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        leading: ButtonSquare(
            onPressed: () => Get.back(),
            icon: Icon(CupertinoIcons.chevron_back,
                color: Colors.white, size: 26),
            bgColor: Colors.transparent),
      ),
      backgroundColor: kPrimaryColor,
      body: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: kDefautPadding / 2,
          ),
          child: Obx(
            () => controller.isloading.value
                ? LoadingWidget(message: "Loading...")
                : ScrollConfiguration(
                    behavior: MyBehavior(),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: [
                        Container(
                          width: size.width - kDefautPadding,
                          margin:
                              const EdgeInsets.only(top: kDefautPadding / 2),
                          padding: const EdgeInsets.all(kDefautPadding / 2),
                          decoration: BoxDecoration(
                              color: kQuaternaryColor,
                              borderRadius: BorderRadius.circular(7)),
                          child: RichText(
                            textAlign: TextAlign.justify,
                            text: TextSpan(
                              style: GoogleFonts.mulish(
                                  color: textColor,
                                  fontSize: 14,
                                  wordSpacing: 2,
                                  fontWeight: FontWeight.w300),
                              children: <TextSpan>[
                                TextSpan(
                                    text:
                                        'Bạn vừa đọc hết chương mới nhất của truyện '),
                                TextSpan(
                                    text: '${controller.bookname.value} ',
                                    style: GoogleFonts.mulish(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text:
                                        'không biết nên đọc tiếp truyện gì khác? Đừng lo lắng, chúng tôi xin giới thiệu đến bạn một số bộ truyện mà các "đồng đạo" khác đang đọc '),
                                TextSpan(
                                    text: '${controller.bookname.value} ',
                                    style: GoogleFonts.mulish(
                                        fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w700)),
                                TextSpan(
                                    text:
                                        'cũng đang tu luyện. Dữ liệu các truyện này được phân tích từ lịch sử đọc truyện trên toàn hệ thống, đảm bảo bạn sẽ tìm được bộ truyện ưng ý tiếp theo để đọc từ những truyện bên dưới. Nếu bạn chưa đăng nhập thì hãy đăng nhập ngay nhé, dữ liệu sẽ chính xác hơn khi có có lịch sử đọc truyện của bạn.')
                              ],
                            ),
                          ),
                        ),
                        for (int i = 0; i <= controller.books.length - 1; i++)
                          GestureDetector(
                            onTap: () => Get.toNamed(
                                '/book?id=${controller.books[i].id}'),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefautPadding / 2,
                                  vertical: kDefautPadding / 2),
                              margin: const EdgeInsets.only(
                                  top: kDefautPadding / 2),
                              decoration: BoxDecoration(
                                color: kTertiaryColor,
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildItemImage(size, controller.books[i]),
                                  const SizedBox(width: 10),
                                  _buildItemRight(size, controller.books[i]),
                                ],
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
          )),
    );
  }

  Widget _buildItemImage(Size size, data) => SizedBox(
        width: 70,
        height: 70 * 4 / 3,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(7),
          child: CachedNetworkImage(
            imageUrl: '$base_Url/tcv/public/uploads/truyen/${data.hinhanh}',
            placeholder: (BuildContext context, String url) => Container(
                height: 70 * 4 / 3, width: 70, color: kQuaternaryColor),
            fit: BoxFit.cover,
            errorWidget: (context, url, error) => Container(
                height: 70 * 4 / 3, width: 70, color: kQuaternaryColor),
          ),
        ),
      );

  Widget _buildItemRight(Size size, data) => Container(
        width: (size.width - 40) / 5 * 4 - 10,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: (size.width - 40) / 5 * 4 - 10,
              child: Text('${data.tentruyen}',
                  style: GoogleFonts.mulish(
                      color: textColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w400),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: (size.width - 40) / 5 * 4 - 10,
              child: Text('Tác giả: ${data.tacgia}',
                  style: GoogleFonts.mulish(
                      color: textColor,
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1),
            ),
            SizedBox(
              width: (size.width - 40) / 5 * 4 - 10,
              child: Html(
                data: data.mota,
                style: {
                  "body": Style(
                      padding: EdgeInsets.all(0),
                      margin: EdgeInsets.all(0),
                      fontSize: FontSize(14.0),
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Mulish',
                      textOverflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      color: textColor,
                      wordSpacing: 2),
                },
              ),
            ),
            Row(children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: kDefautPadding / 2,
                    vertical: kDefautPadding / 7),
                decoration: BoxDecoration(
                    border: Border.all(color: kSecondaryColor, width: 1),
                    borderRadius: BorderRadius.circular(5)),
                child: Text('${data.theloai}',
                    style: GoogleFonts.mulish(
                        color: textColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w300)),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.star, color: textColor, size: 16),
              const SizedBox(width: 2),
              Text(data.sosao < 1 ? '0' : data.sosao!.toStringAsFixed(1),
                  style: GoogleFonts.mulish(
                      color: textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w300)),
              const SizedBox(width: 10),
              const Icon(Icons.book, color: textColor, size: 16),
              const SizedBox(width: 2),
              Text('${data.chuongmoinhat}',
                  style: GoogleFonts.mulish(
                      color: textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w300)),
              const SizedBox(width: 10),
              const Icon(Icons.remove_red_eye, color: textColor, size: 16),
              const SizedBox(width: 2),
              Text('${oCcy.format(data.luotxem)}',
                  style: GoogleFonts.mulish(
                      color: textColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w300)),
            ])
          ],
        ),
      );
}
