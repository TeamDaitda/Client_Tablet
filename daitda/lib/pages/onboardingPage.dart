import 'package:daitda/pages/categoryPage.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:onboarding/onboarding.dart';

import 'homePage.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<String> _urls = [];

  final onboardingPagesList = [
    PageModel(
      assetPath: 'images/main.png',
      title: '선을 모아 마음을 잇다',
      info: "촬영을 통해 당신만의 아름다운 선을 만들어보세요\n하나하나의 선이 모여 기부가 됩니다.",
    ),
    PageModel(
      assetPath: 'images/main.png',
      title: '재미있게, 의미있게, 기부하다',
      info: ' 내가 기부하고 싶은 카테고리를 선택해요\n사진을 찍고 광고를 시청하면 기부 완료!',
    ),
    PageModel(
      assetPath: 'images/main.png',
      title: '세상에 하나 뿐인 기부 명세서',
      info: '촬영이 끝나면, 기부내역이 적힌 포토카드를 드려요.',
    ),
    PageModel(
      assetPath: 'images/main.png',
      title: '그럼 시작해볼까요?',
      info: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Onboarding(
        proceedButtonStyle: ProceedButtonStyle(
            proceedButtonRoute: (context) {
              Get.toNamed('/homePage');
            },
            proceedButtonText: 'main',
            proceedButtonColor: Colors.black),
        pages: onboardingPagesList,
        indicator: Indicator(
          indicatorDesign: IndicatorDesign.line(
            lineDesign: LineDesign(
              lineType: DesignType.line_uniform,
            ),
          ),
        ),
        titleStyle: TextStyle(
            fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white),
        infoStyle: TextStyle(fontSize: 25, color: Colors.white),
        titleAndInfoPadding: EdgeInsets.symmetric(vertical: 30, horizontal: 5),
      ),
    );
  }
}
