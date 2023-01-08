import 'package:client/src/repo/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/lib_book.dart';

class SearchBookController extends GetxController {
  RxBool isloading = false.obs;
  List<dynamic> books = List<dynamic>.empty(growable: true).obs;

  final TextEditingController textController = TextEditingController();

  getBook(key) async {
    try {
      isloading(true);
      await BookRepo.loadSearchBook(key).then((res) {
        books.clear();
        books.addAll(res.map((data) => BookLibrary.fromJson(data)).toList());
      }).catchError((e) {
        throw Exception(e);
      });
    } catch (e) {
      throw Exception(e);
    } finally {
      isloading(false);
    }
  }
}
