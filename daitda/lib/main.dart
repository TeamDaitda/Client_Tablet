import 'package:daitda/pages/categoryPage.dart';
import 'package:daitda/pages/detailPage.dart';
import 'package:daitda/pages/homePage.dart';
import 'package:daitda/pages/inputPage.dart';
import 'package:daitda/pages/paymentPage.dart';
import 'package:daitda/pages/resultPage.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.white,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(
            name: '/categoryPage',
            page: () => CategoryPage(),
            transition: Transition.topLevel),
        GetPage(name: '/detailPage', page: () => DetailPage()),
        GetPage(name: '/inputPage', page: () => InputPage()),
        GetPage(
            name: '/paymentPage',
            page: () => PaymentPage(),
            transition: Transition.topLevel),
        GetPage(name: '/resultPage', page: () => ResultPage()),
      ],
    );
  }
}
