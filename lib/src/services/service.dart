import 'package:flutter/material.dart';

class Service {
  static String base_Url = "http://192.168.1.12:8081";

  static String appFirstName = 'Cana';
  static String appLastName = 'book';
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
