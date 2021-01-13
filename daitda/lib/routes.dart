import 'package:flutter/material.dart';

import 'pages/categoryPage.dart';
import 'pages/detailPage.dart';
import 'pages/homePage.dart';
import 'pages/inputPage.dart';
import 'pages/paymentPage.dart';
import 'pages/resultPage.dart';

final routes = {
  '/': (BuildContext context) => HomePage(),
  '/categoryPage': (BuildContext context) => CategoryPage(),
  '/detailPage': (BuildContext context) => DetailPage(),
  '/inputPage': (BuildContext context) => InputPage(),
  '/paymentPage': (BuildContext context) => PaymentPage(),
  '/resultPage': (BuildContext context) => ResultPage()
};
