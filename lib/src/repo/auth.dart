import 'dart:convert';

import 'package:http/http.dart' as http;

import '../services/service.dart';

class AuthRepo {
  static String baseUrl = Service.base_Url;

  static googleSignIn(data) async {
    final String url = '$baseUrl/tcv/public/api/v1/google_sign_in';
    try {
      final http.Response res = await http.post(
        Uri.parse(url),
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
}
