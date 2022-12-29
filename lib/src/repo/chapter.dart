import 'dart:convert';

import 'package:http/http.dart' as http;

import '../services/service.dart';

class ChapterRepo {
  static String base_Url = Service.base_Url;

  static Future fetchAllChapter(truyenId) async {
    try {
      final http.Response res = await http.get(
        Uri.parse('$base_Url/tcv/public/api/v2/list_chapter/$truyenId'),
      );
      if (res.statusCode == 200) return json.decode(res.body);
      throw Exception('Thất bại');
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future fetchChapter(cusId, truyenId, slug) async {
    try {
      final http.Response res = await http.get(
        Uri.parse('$base_Url/tcv/public/api/v1/books/$cusId/$truyenId/$slug'),
      );
      if (res.statusCode == 200) return json.decode(res.body);
      throw Exception('Thất bại');
    } catch (e) {
      throw Exception(e);
    }
  }
}
