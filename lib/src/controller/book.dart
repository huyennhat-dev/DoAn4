import 'package:get/get.dart';

import '../model/book.dart';
import '../repo/book.dart';

class BookController extends GetxController {
  RxBool isLoading = false.obs;
  Book? book;

  loadBook(uid, id) async {
    try {
      isLoading(true);
      final body = await BookRepo.fetchBook(uid, id);
      book = Book.fromJson(body);
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading(false);
    }
  }
}
