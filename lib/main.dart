import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prueba_and_lond/home/home_binding.dart';
import 'package:prueba_and_lond/home/home_page.dart';
import 'package:prueba_and_lond/routes/app_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prueba Andrés Londoño',
      home: const HomePage(),
      initialBinding: HomeBinding(),
      getPages: AppPages.pages,
    );
  }
}
