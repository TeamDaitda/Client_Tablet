import 'package:daitda/controller/Controllers.dart' as CONTROLLERS;
import 'package:daitda/UIComponent/UIComponents.dart' as UICOMPONENTS;
import 'package:daitda/design/designs.dart' as DESIGNS;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
//  Design Setting.
  final designSet = Get.put(DESIGNS.DesignSet());
  final colorSet = DESIGNS.ColorSet();

  //  Controller Setting.
  final progressData = Get.put(CONTROLLERS.ProgressData());
  final userController = Get.put(CONTROLLERS.UserController());
  final categoryController = Get.put(CONTROLLERS.Category());

  /*
   * 현재 페이지의 인덱스와 이를 바탕으로 계산될 프로그래스의 인덱스입니다.
   * 
   * The index of the current page and the progress that will be calculated based on it.
   */
  static double thisPageIndex;
  static double thisPageProgressIndex;
  InterstitialAd myInterstitial;
  bool hasFailed;

  @override
  void initState() {
    /*
     * 현재 페이지의 인덱스.
     * 
     * The index of the current page.
     */
    thisPageIndex = 2;
    thisPageProgressIndex = 0.2 * (thisPageIndex + 1);

    /*
     * 현재 페이지의 인덱스를 사용하여 구성합니다.
     * 
     * Configure using the index on the current page.
     */
    progressData.setData(thisPageProgressIndex);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Column(
              children: [
                renderLogoArea(),
                renderProgressArea(),
              ],
            ),
            Row(
              children: [
                renderPaymentArea(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget renderLogoArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.logoAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: SvgPicture.asset(
          'images/sym.svg',
          width: 10,
          height: 10,
        ),
      ),
      width: designSet.getLogoAreaWidth(),
      height: designSet.getLogoAreaHeight(),
    );
  }

  Widget renderProgressArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.logoAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.logoAreaColor,
        ),
      ),
      width: designSet.getProgressAreaWidth(),
      height: designSet.getProgressAreaHeight(),
      child: Column(
        children: [
          UICOMPONENTS.AnimatedLiquidLinearProgressIndicator(),
          UICOMPONENTS.ProcessBar(
            index: thisPageIndex.toInt(),
          ),
        ],
      ),
    );
  }

  Widget renderPaymentArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.mainAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
        ),
      ),
      width: designSet.getPaymentAreaWidth(),
      height: designSet.getPaymentAreaHeight(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: colorSet.mainAreaColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: <Widget> [
              Center(
                child: Opacity(
                 child: SvgPicture.asset(
              'images/sym.svg',
              width:840,
              height: 840,
            ),
            opacity: 0.05,),
              ),

              Center(
                child: Text(
                  "${userController.getName()}님께서 선택하신 ${categoryController.categoryMember[userController.getSelectedCategoryIndex()].title}에 기부가 완료되었어요.\n\n 하단 버튼을 누르면 촬영을 시작합니다. 기부자님의 아름다운 미소를 보여주세요! ",

                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white
                  ),
                  ),
              ),

              Container(
                alignment: Alignment(0.90, 0.95),
                child: OutlinedButton(
                  onPressed: () {
                      Get.toNamed('/cameraPage');
                  },
                  child: Text('촬영하기',
                  style: TextStyle(color: Colors.black,fontSize: 18),
                  ),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.white,
                    backgroundColor: Colors.white,
                    shadowColor: Colors.black,
                    elevation: 11,
                  ),
                ),
              )
            ],

          ),
        ),
      ),
    );
  }
}
