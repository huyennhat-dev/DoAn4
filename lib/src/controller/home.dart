import 'package:client/src/model/book_reco.dart';
import 'package:client/src/model/home_book.dart';
import 'package:client/src/repo/home.dart';
import 'package:get/get.dart';

import '../helpers/shared_pref.dart';
import '../model/recent_review.dart';

class HomeController extends GetxController {
  RxBool isLoading = false.obs;

  RxString uId = "".obs;
  RxString uName = "".obs;
  RxString uEmail = "".obs;
  RxString uPhoto = "".obs;

  List<dynamic> banners = List<dynamic>.empty(growable: true).obs;
  List<dynamic> newbookupdates = List<dynamic>.empty(growable: true).obs;
  List<dynamic> selectBooks = List<dynamic>.empty(growable: true).obs;
  List<dynamic> recentReviews = List<dynamic>.empty(growable: true).obs;
  List<dynamic> newBooks = List<dynamic>.empty(growable: true).obs;
  List<dynamic> bookRecommendations = List<dynamic>.empty(growable: true).obs;

  setUsername() async {
    uId.value = await SharedPref().read('UID') ?? "";
    uName.value = await SharedPref().read('USERNAME') ?? "";
    uEmail.value = await SharedPref().read('UEMAIL') ?? "";
    uPhoto.value = await SharedPref().read('UPHOTO') ?? "";
    update();
  }

  fetchHomeData() async {
    try {
      isLoading(true);
      final body = await HomeRepo.fetchHomeData();
      banners.addAll(
          body['banner'].map((data) => HomeBook.fromJson(data)).toList());
      newbookupdates.addAll(body['newbookupdate']
          .map((data) => HomeBook.fromJson(data))
          .toList());
      selectBooks.addAll(
          body['selectbook'].map((data) => HomeBook.fromJson(data)).toList());

      recentReviews.addAll(body['recentreview']
          .map((data) => RecentReview.fromJson(data))
          .toList());

      newBooks.addAll(
          body['newbook'].map((data) => HomeBook.fromJson(data)).toList());
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading(false);
    }
  }

  fetchBookRecommendation() async {
    try {
      await HomeRepo.fetchBookRecommendation(
              await SharedPref().read('UID') ?? -1)
          .then((value) {
        bookRecommendations.addAll(
            value.map((data) => BookRecommendation.fromJson(data)).toList());
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  signOut() async {
    try {
      isLoading(true);

      await SharedPref().remove('UID');
      await SharedPref().remove('UEMAIL');
      await SharedPref().remove('USERNAME ');
      await SharedPref().remove('UPHOTO');

      Get.offAllNamed('/');
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading(false);
    }
  }
}
