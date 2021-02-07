import 'package:daitda/design/designSet.dart';
import 'package:daitda/pages/cameraPage.dart';
import 'package:daitda/pages/categoryPage.dart';
import 'package:daitda/pages/detailPage.dart';
import 'package:daitda/pages/homePage.dart';
import 'package:daitda/pages/inputPage.dart';
import 'package:daitda/pages/paymentPage.dart';
import 'package:daitda/pages/resultPage.dart';
import 'package:daitda/pages/testPage.dart';

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
        splashColor: Colors.transparent,
        accentColor: Colors.white,
        highlightColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage()),
        GetPage(
            name: '/categoryPage',
            page: () => CategoryPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/detailPage',
            page: () => DetailPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/inputPage',
            page: () => InputPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/paymentPage',
            page: () => PaymentPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/cameraPage',
            page: () => CameraPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/resultPage',
            page: () => ResultPage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/testPage',
            page: () => TestPage(),
            transition: Transition.fadeIn),
      ],
    );
  }
}
