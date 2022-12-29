import 'package:get/get.dart';

import '../model/list_chapter.dart';
import '../repo/chapter.dart';

class ChapterController extends GetxController {
  RxBool isLoading = false.obs;
  List<Danhsachchuong>? chapters;

  loadAllChapter(truyenId) async {
    try {
      isLoading(true);

      List body = await ChapterRepo.fetchAllChapter(truyenId);
      chapters = body.map((data) => Danhsachchuong.fromJson(data)).toList();
    } catch (e) {
      throw Exception(e);
    } finally {
      isLoading(false);
    }
  }
}
