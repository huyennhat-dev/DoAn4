import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home/home.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      title: 'Canabook',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
