import 'dart:convert';
import 'package:http/http.dart' as http;

import '../services/service.dart';

class HomeRepo {
  static String base_Url = Service.base_Url;

  static Future fetchHomeData() async {
    final res =
        await http.get(Uri.parse('$base_Url/tcv/public/api/v2/home-data'));
    if (res.statusCode == 200) return json.decode(res.body);
    throw Exception('Có lỗi rồi!');
  }

  static Future fetchBanner() async {
    final res = await http.get(Uri.parse('$base_Url/tcv/public/api/v2/banner'));
    if (res.statusCode == 200) return json.decode(res.body);
    throw Exception('Có lỗi rồi!');
  }

  static Future fetchBookNewUpdate() async {
    final res = await http
        .get(Uri.parse('$base_Url/tcv/public/api/v2/book_new_update'));
    if (res.statusCode == 200) return json.decode(res.body);
    throw Exception('Có lỗi rồi!');
  }

  static Future fetchTopBook() async {
    final res =
        await http.get(Uri.parse('$base_Url/tcv/public/api/v2/topvote'));
    if (res.statusCode == 200) return json.decode(res.body);
    throw Exception('Có lỗi rồi!');
  }
}
