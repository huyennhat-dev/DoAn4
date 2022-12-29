import 'package:client/src/model/chapter.dart';
import 'package:client/src/model/list_chapter.dart';
import 'package:get/get.dart';

import '../helpers/shared_pref.dart';
import '../model/book.dart';
import '../repo/book.dart';

class BookController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLoading2 = false.obs;
  Book? book;
  List<Danhsachchuong>? chapters;
  Chapter? chapter;
  String cusId = "";

  loadBook(id) async {
    try {
      isLoading(true);
      final body = await BookRepo.fetchBook(id);
      book = Book.fromJson(body);
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading(false);
    }
  }

  loadAllChapter(truyenId) async {
    try {
      isLoading(true);

      List body = await BookRepo.fetchAllChapter(truyenId);
      chapters = body.map((data) => Danhsachchuong.fromJson(data)).toList();
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading(false);
    }
  }

  // loadChapter(truyenId, slug) async {
  //   try {
  //     isLoading2(true);
  //     cusId = (await SharedPref().read('UID'))!;
  //     if (cusId == null) cusId = '0';
  //     final body = await BookRepo.fetchChapter(cusId, truyenId, slug);
  //     chapter = Chapter.fromJson(body);
  //   } catch (e) {
  //     throw Exception(e);
  //   } finally {
  //     isLoading2(false);
  //   }
  // }
}
