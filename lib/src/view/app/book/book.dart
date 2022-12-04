import 'dart:convert';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../model/book.dart';
import '../../../services/service.dart';
import '../../contains.dart';
import 'components/book_information.dart';
import 'components/header.dart';
import '../widget/list_chapter.dart';

import 'package:http/http.dart' as http;

import 'components/nominations.dart';

final String base_Url = Service.base_Url;

Future<Book> fetchBook(id) async {
  final response = await http.get(
    Uri.parse('$base_Url/tcv/public/api/v2/books/$id'),
  );
  if (response.statusCode == 200) {
    return Book.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Có lỗi rồi !');
  }
}

class BookPage extends StatefulWidget {
  const BookPage({super.key, required this.truyen_id});

  final int truyen_id;

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  final ScrollController _scrollController = ScrollController();
  late Future<Book> futureBook;

  @override
  void initState() {
    super.initState();
    setState(() {
      futureBook = fetchBook(widget.truyen_id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          backgroundColor: kPrimaryColor,
        ),
        body: Container(
            alignment: Alignment.topCenter,
            constraints: const BoxConstraints.expand(),
            child: ScrollConfiguration(
                behavior: MyBehavior(),
                child: SingleChildScrollView(
                    controller: _scrollController,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: FutureBuilder<Book>(
                      future: futureBook,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Stack(children: [
                            CachedNetworkImage(
                              imageUrl: '$base_Url/tcv/public/uploads/truyen/' +
                                  snapshot.data!.hinhanh.toString(),
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 260,
                                width: size.width,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 0),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                                child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10.0, sigmaY: 10.0),
                                    child: Container()),
                              ),
                              placeholder: (context, url) => Container(
                                  alignment: Alignment.center,
                                  height: 160,
                                  width: size.width,
                                  child: CircularProgressIndicator(
                                      color: kSecondaryColor,
                                      strokeWidth: 1.5)),
                              errorWidget: (context, url, error) => Container(
                                  alignment: Alignment.center,
                                  height: 160,
                                  width: size.width,
                                  child: Icon(
                                    Icons.error,
                                    color: kErrorColor,
                                  )),
                            ),
                            Column(
                              children: [
                                BookPageHeader(
                                    onPressed: () => Navigator.pop(context)),
                                BookInfomation(
                                  image:
                                      '$base_Url/tcv/public/uploads/truyen/' +
                                          snapshot.data!.hinhanh.toString(),
                                  bookName: snapshot.data!.tentruyen.toString(),
                                  authorName: snapshot.data!.tacgia.toString(),
                                  bookStatus:
                                      (snapshot.data!.tinhtrang)!.toInt(),
                                  desc: snapshot.data!.mota.toString(),
                                  category: [
                                    snapshot.data!.theloai.toString(),
                                    snapshot.data!.tinhcach.toString(),
                                    snapshot.data!.thegioi.toString(),
                                    snapshot.data!.luuphai.toString(),
                                  ],
                                  rate: (snapshot.data!.sosao)!.toDouble(),
                                  chuongmoinhat:
                                      snapshot.data!.danhsachchuong!.length,
                                  truyenid: snapshot.data!.id!.toInt(),
                                  scrollController: _scrollController,
                                ),
                                ListChapter(
                                  truyenid: snapshot.data!.id!.toInt(),
                                  chapters: snapshot.data!.danhsachchuong!,
                                ),
                                Nominations()
                              ],
                            ),
                          ]);
                        }
                        return Center(
                          child: Container(),
                        );
                      },
                    )))));
  }
}
