import 'dart:convert';

import 'package:http/http.dart' as http;

import '../services/service.dart';

class BookRepo {
  static String base_Url = Service.base_Url;

  static Future fetchBook(id) async {
    try {
      final http.Response res = await http.get(
        Uri.parse('$base_Url/tcv/public/api/v2/books/$id'),
      );
      if (res.statusCode == 200) return json.decode(res.body);
      throw Exception('Thất bại');
    } catch (e) {
      throw Exception(e);
    }
  }
}
