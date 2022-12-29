import 'package:client/src/model/user.dart';
import 'package:get/get.dart';

import '../helpers/shared_pref.dart';

class HomeController extends GetxController {
  RxString uId = "".obs;
  RxString uName = "".obs;
  RxString uEmail = "".obs;
  RxString uPhoto = "".obs;

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
}
