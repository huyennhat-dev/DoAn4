import 'package:flutter/material.dart';

class Service {
  static String base_Url = "http://10.60.13.186:8080";

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
