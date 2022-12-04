import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../model/chapter.dart';
import '../../../services/service.dart';
import '../../contains.dart';
import 'components/chapter_content.dart';
import 'components/header.dart';

import 'package:http/http.dart' as http;

final String base_Url = Service.base_Url;

class BookChapter extends StatefulWidget {
  const BookChapter(
      {super.key, required this.slugChuong, required this.truyen_id});

  final int slugChuong;
  final int truyen_id;

  @override
  State<BookChapter> createState() => _BookChapterState();
}

class _BookChapterState extends State<BookChapter> {
  var userJson;
  var user;
  var cusId;
  var slug = 1;
  late Future<Chapter> futureChapter;

  Future<Chapter> fetchChapter(slug) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    userJson = localStorage.getString('user');
    if (userJson != null) {
      user = json.decode(userJson!);
    }
    if (user != null) {
      cusId = user['id'].toString();
    } else {
      cusId = '-1';
    }
    final response = await http.get(Uri.parse(
        '$base_Url/tcv/public/api/v1/books/1/${widget.truyen_id}/$slug'));
    if (response.statusCode == 200) {
      return Chapter.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Có lỗi rồi!');
    }
  }

  @override
  void initState() {
    super.initState();
    slug = widget.slugChuong;
    futureChapter = fetchChapter(slug);
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
        child: FutureBuilder<Chapter>(
            future: futureChapter,
            builder: (context, snapshot) {
              if (snapshot.hasData)
                return Column(
                  children: [
                    BookChapterHeader(
                        chapterName:
                            'Chương ${snapshot.data!.slug}: ${snapshot.data!.tenchuong}'),
                    Expanded(
                        flex: 1,
                        child: BookChapterContent(
                          content: snapshot.data!.noidung.toString(),
                        ))
                  ],
                );

              return Container();
            }),
      ),
    );
  }
}
