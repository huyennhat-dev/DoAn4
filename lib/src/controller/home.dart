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

  List<dynamic>? banners;
  List<dynamic>? newbookupdates;
  List<dynamic>? selectBooks;
  List<dynamic>? recentReviews;
  List<dynamic>? newBooks;

  @override
  void onInit() {
    setUsername();
    super.onInit();
  }

  void setUsername() async {
    uId.value = (await SharedPref().read('UID'))!;
    uName.value = (await SharedPref().read('USERNAME'))!;
    uEmail.value = (await SharedPref().read('UEMAIL'))!;
    uPhoto.value = (await SharedPref().read('UPHOTO'))!;
    update();
  }

  fetchHomeData() async {
    try {
      isLoading(true);
      final body = await HomeRepo.fetchHomeData();
      print(body['recentreview']);
      banners = body['banner'].map((data) => HomeBook.fromJson(data)).toList();
      newbookupdates =
          body['newbookupdate'].map((data) => HomeBook.fromJson(data)).toList();
      selectBooks =
          body['selectbook'].map((data) => HomeBook.fromJson(data)).toList();

      recentReviews = body['recentreview']
          .map((data) => RecentReview.fromJson(data))
          .toList();

      newBooks =
          body['newbook'].map((data) => HomeBook.fromJson(data)).toList();
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading(false);
    }
  }

  signOut() async {
    await SharedPref().remove('UID');
    await SharedPref().remove('UEMAIL');
    await SharedPref().remove('USERNAME ');
    await SharedPref().remove('UPHOTO');

    Get.offAll(
      const HomePage(),
      transition: Transition.cupertino,
      duration: const Duration(milliseconds: 300),
    );
  }
}
