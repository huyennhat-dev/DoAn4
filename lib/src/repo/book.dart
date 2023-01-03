import 'dart:convert';

import 'package:http/http.dart' as http;

import '../services/service.dart';

class BookRepo {
  static String base_Url = Service.base_Url;

  static Future fetchBook(uid, id) async {
    try {
      final http.Response res = await http.get(
        Uri.parse('$base_Url/tcv/public/api/v2/books/$uid/$id'),
      );
      if (res.statusCode == 200) return json.decode(res.body);
      throw Exception('Thất bại');
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future fetchHistoryBook(id, page) async {
    try {
      final http.Response res = await http.get(
        Uri.parse('$base_Url/tcv/public/api/v2/library/history/$id?page=$page'),
      );
      if (res.statusCode == 200) return json.decode(res.body);
      throw Exception('Thất bại');
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future delHistoryBook(id) async {
    try {
      final http.Response res = await http
          .delete(Uri.parse('$base_Url/tcv/public/api/v2/delete_history/$id'));
      if (res.statusCode == 200) return json.decode(res.body);
      throw Exception('Thất bại');
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future bookMark(data) async {
    try {
      final http.Response res = await http.post(
        Uri.parse('$base_Url/tcv/public/api/v2/library/bookmark'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(data),
      );
      if (res.statusCode == 200) return json.decode(res.body);
      throw Exception('Thất bại');
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future fetchBookMark(id, page) async {
    try {
      final http.Response res = await http.get(
        Uri.parse(
            '$base_Url/tcv/public/api/v2/library/bookmark/$id?page=$page'),
      );
      if (res.statusCode == 200) return json.decode(res.body);
      throw Exception('Thất bại');
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future delBookMark(id) async {
    try {
      final http.Response res = await http
          .delete(Uri.parse('$base_Url/tcv/public/api/v2/delete_bookmark/$id'));
      if (res.statusCode == 200) return json.decode(res.body);
      throw Exception('Thất bại');
    } catch (e) {
      throw Exception(e);
    }
  }
}
