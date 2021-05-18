import 'package:daitda/design/designs.dart';
import 'package:daitda/service/userService.dart';
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
      assetPath: 'images/page1.png',
      title: '선을 모아 마음을 잇다',
      info: "당신만의 아름다운 선을 그려드려요.\n모두의 선이 모여 하나의 마음이 됩니다.",
    ),
    PageModel(
      assetPath: 'images/page2.png',
      title: '간편하게, 재미있게, 의미있게.',
      info: '기부하고 싶은 카테고리를 선택하세요.\n광고시청 후 촬영 한 번이면 기부 끝!',
    ),
    PageModel(
      assetPath: 'images/page3.png',
      title: '하나 뿐인 당신만의 기부 명세서',
      info: '기부가 끝나면, 명세가 담긴 포토카드를 드려요.\n세상에서 단 하나뿐인 감사의 마음입니다.',
    ),
    PageModel(
      assetPath: 'images/page4.png',
      title: '이제 시작해볼까요?',
      info: '당신의 선을 확인해보세요.',
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
        background: ColorSet().backgroundColor,
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
            fontSize: 45,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Nanum'),
        infoStyle: TextStyle(
          fontSize: 28,
          color: Colors.white,
          fontFamily: 'Nanum',
        ),
        titleAndInfoPadding: EdgeInsets.symmetric(vertical: 35, horizontal: 5),
      ),
    );
  }
}
