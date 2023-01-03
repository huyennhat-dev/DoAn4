import 'package:client/src/model/book_reco.dart';
import 'package:client/src/model/home_book.dart';
import 'package:client/src/repo/home.dart';
import 'package:get/get.dart';

import '../helpers/shared_pref.dart';
import '../model/recent_review.dart';
import '../view/app/home/home.dart';

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
      final body =
          await HomeRepo.fetchBookRecommendation(uId.isNotEmpty ? uId : -1);
      bookRecommendations =
          body.map((data) => BookRecommendation.fromJson(data)).toList();
    } catch (e) {
      throw Exception(e);
    } finally {}
  }

  signOut() async {
    try {
      isLoading(true);

      await SharedPref().remove('UID');
      await SharedPref().remove('UEMAIL');
      await SharedPref().remove('USERNAME ');
      await SharedPref().remove('UPHOTO');

      Get.offAll(
        const HomePage(),
        transition: Transition.cupertino,
        duration: const Duration(milliseconds: 300),
      );
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading(false);
    }
  }
}
