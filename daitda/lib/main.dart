import 'package:daitda/design/designSet.dart';
import 'package:daitda/pages/cameraPage.dart';
import 'package:daitda/pages/categoryPage.dart';
import 'package:daitda/pages/homePage.dart';
import 'package:daitda/pages/inputPage.dart';
import 'package:daitda/pages/paymentPage.dart';
import 'package:daitda/pages/resultPage.dart';
import 'package:daitda/pages/testPage.dart';
import 'package:daitda/pages/onboardingPage.dart';
import 'package:daitda/pages/galleryPage.dart';
import 'package:daitda/pages/previewPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DAITDA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        accentColor: Colors.white,
        highlightColor: Colors.transparent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => OnboardingPage()),
        GetPage(
            name: '/homePage',
            page: () => HomePage(),
            transition: Transition.fadeIn),
        GetPage(
            name: '/categoryPage',
            page: () => CategoryPage(),
            transition: Transition.fadeIn),
         GetPage(
            name: '/galleryPage',
            page: () => GalleryPage(),
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
            name: '/previewPage',
            page: () => PreviewPage(),
            transition: Transition.fadeIn),

        GetPage(
            name: '/resultPage',
            page: () => ResultPage(),
            transition: Transition.fadeIn),

        /*GetPage(
            name: '/testPage',
            page: () => TestPage(),
            transition: Transition.fadeIn),*/
      ],
    );
  }
}
