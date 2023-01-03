import 'package:client/src/model/lib_book.dart';
import 'package:client/src/repo/book.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadHistoryController extends GetxController {
  RxBool isloading = false.obs;
  RxBool isMoreDataAvailable = true.obs;

  ScrollController scrollController = ScrollController();

  RxInt page = 1.obs;
  List<dynamic> books = List<dynamic>.empty(growable: true).obs;

  void getTask() async {
    try {
      isMoreDataAvailable(false);
      isloading(true);
      final body = await BookRepo.fetchHistoryBook(68, page);
      books.addAll(body.map((data) => BookLibrary.fromJson(data)).toList());
    } catch (e) {
      throw Exception(e);
    } finally {
      isloading(false);
    }
  }

  void paginateTask() {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        page++;
        getMoreTask(page);
      }
    });
  }

  void getMoreTask(RxInt page) {
    try {
      BookRepo.fetchHistoryBook(68, page).then((resp) {
        isMoreDataAvailable(false);
        if (resp.length > 0) isMoreDataAvailable(true);
        books.addAll(resp.map((data) => BookLibrary.fromJson(data)).toList());
      });
    } catch (e) {
      throw Exception(e);
    } finally {
      isMoreDataAvailable(false);
    }
  }

  void delBook(id) async {
    try {
      print(id);
      final body = await BookRepo.delHistoryBook(id);
      if (body['success']) {
        books.removeWhere((element) => element.id == id);
        update();
      }
    } catch (e) {
      Exception(e);
    }
  }
}
