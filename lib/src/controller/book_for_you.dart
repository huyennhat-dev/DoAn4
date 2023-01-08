import 'package:client/src/model/book_for_you.dart';
import 'package:client/src/repo/book.dart';
import 'package:get/get.dart';

class BookForYouController extends GetxController {
  RxBool isloading = false.obs;
  RxString bookname = "".obs;
  List<dynamic> books = List<dynamic>.empty(growable: true).obs;

  fetchData(truyenid) async {
    try {
      isloading(true);
      await BookRepo.loadBookForYou(truyenid).then((value) {
        bookname.value = value['tentruyen'];
        books.addAll(
            value['data'].map((data) => BookForYou.fromJson(data)).toList());
        update();
      });
    } catch (e) {
      throw Exception(e);
    } finally {
      isloading(false);
    }
  }
}
