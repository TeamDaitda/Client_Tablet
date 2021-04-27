import 'package:daitda/controller/Controllers.dart' as CONTROLLERS;
import 'package:daitda/UIComponent/UIComponents.dart' as UICOMPONENTS;
import 'package:daitda/design/designs.dart' as DESIGNS;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:signature/signature.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //  Design Setting.
  final designSet = Get.put(DESIGNS.DesignSet());
  final colorSet = DESIGNS.ColorSet();

  //  Controller Setting.
  final progressData = Get.put(CONTROLLERS.ProgressData());
  final userController = Get.put(CONTROLLERS.UserController());

  /*
   * 입력받을 사용자의 정보.
   * 
   * Information for the user to be entered.
   */
  static String nameText;
  static String phoneText;
  static String affiliationText;

  /*
   * 사용자가 선택한 카테고리.
   * 
   * Categories selected by user.
   */
  CONTROLLERS.CategoryMember thisCategoryMember;

  /*
   * 현재 페이지의 인덱스와 이를 바탕으로 계산될 프로그래스의 인덱스입니다.
   * 
   * The index of the current page and the progress that will be calculated based on it.
   */
  static double thisPageIndex;
  static double thisPageProgressIndex;

  /*
   * 사용자 사인을 위한 사인 컨트롤러.
   * 
   * Sign controller for user signatures.
   */
  final SignatureController signatureController = SignatureController(
    penStrokeWidth: 3,
    penColor: Colors.black,
    exportBackgroundColor: Colors.white,
  );
  InterstitialAd myInterstitial;
  bool hasFailed;

  @override
  void initState() {
    /*
     * 현재 페이지의 인덱스.
     * 
     * The index of the current page.
     */
    thisPageIndex = 1;
    thisPageProgressIndex = 0.2 * (thisPageIndex + 1);

    /*
     * 이전페이지(categoryPage)에서 선택한 카테고리에 대한 정보를
     * Get.arguments로 받아와 thisCategoryMember 변수에 저장.
     * 
     * Information about the category selected
     * on the previous page(categoryPage) is received
     * as 'Get.arguments' and stored in the variable 'thisCategoryMembers'.
     */
    thisCategoryMember = Get.arguments;

    /*
     * 사용자가 입력할 정보를 초기화 합니다.
     * 
     * Initialize the information to be entered by the user.
     */
    nameText = "홍길동";
    phoneText = "010-1234-5678";
    affiliationText = "OO대학교";

    /*
     * 현재 페이지의 인덱스를 사용하여 구성합니다.
     * 
     * Configure using the index on the current page.
     */
    progressData.setData(thisPageProgressIndex);

    /*
     * signatureController를 계속 확인하며 값이 바뀔 때 확인 메시지를 출력.
     * 
     * Continue checking the signatureController and output a confirmation message when the value changes.
     */
    signatureController.addListener(() => print('Value changed'));

    super.initState();
    myInterstitial = InterstitialAd(
      adUnitId: 'ca-app-pub-3940256099942544/4411468910',
      request: AdRequest(),
      listener: AdListener(
        onAdLoaded: (ad) {
          setState(() {
            hasFailed = false;
          });
        },
        onAdClosed: (ad) {
          Get.offAllNamed('/paymentPage');
          ad.dispose(); // dispose of ad
        },
        onAdFailedToLoad: (ad, error) {
          setState(() {
            hasFailed = true;
          });
          ad.dispose(); // dispose of ad
          print('Ad exited with error: $error');
        },
      ),
    );
    myInterstitial.load();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                renderInputcardArea(),
                renderInputArea(),
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
        color: colorSet.progressAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
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

  Widget renderInputcardArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.mainAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
        ),
      ),
      width: designSet.getInputcardAreaWidth(),
      height: designSet.getInputcardAreaHeight(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: colorSet.mainCardMackgroundcolor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "${thisCategoryMember.getTitle()}\n${thisCategoryMember.getsubTitle()}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 20, right: 20, left: 20),
                  child: Container(
                    height: Get.size.height * 0.7,
                    child: thisCategoryMember.getimg(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderInputArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.inputAreaColor,
        border: Border.all(
          width: 0.1,
          color: colorSet.dividorColor,
        ),
      ),
      width: designSet.getInputAreaWidth(),
      height: designSet.getInputAreaHeight(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
              color: colorSet.mainCardMackgroundcolor,
              borderRadius: BorderRadius.circular(20)),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "성함을 알려주세요.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "결과물에 기부자님의 성함이 기재됩니다.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _showDialog(title: "성함을 알려주세요.", index: 0);
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$nameText",
                          style: designSet.getStyleInputPageText(),
                        ),
                      ],
                    ),
                  ),
                ),
                UICOMPONENTS.UIComponent().buildHeightSizedBox(50),
                Text(
                  "연락처를 입력해주세요.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "결과물에 기부자님의 연락처가 기재됩니다.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _showDialog(title: "연락처를 입력해주세요", index: 1);
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$phoneText",
                          style: designSet.getStyleInputPageText(),
                        ),
                      ],
                    ),
                  ),
                ),
                UICOMPONENTS.UIComponent().buildHeightSizedBox(50),
                Text(
                  "직업을 입력해주세요.",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "결과물에 기부자님의 직업이 기재됩니다.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                InkWell(
                  onTap: () {
                    _showDialog(title: "직업을 입력해주세요.", index: 2);
                  },
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "$affiliationText",
                          style: designSet.getStyleInputPageText(),
                        ),
                      ],
                    ),
                  ),
                ),
                UICOMPONENTS.UIComponent().buildHeightSizedBox(50),
                Row(
                  children: [
                    Text(
                      "사인을 해주세요.",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black,
                        ),
                        child: Icon(
                          Icons.refresh_sharp,
                          color: Colors.white,
                        ),
                      ),
                      onTap: () {
                        setState(() => signatureController.clear());
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 301,
                      height: 121,
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      child: Signature(
                        width: 300,
                        height: 120,
                        controller: signatureController,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Container(
                  child: Row(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          hasFailed
                            ? Get.toNamed('/paymentPage')
                            : myInterstitial.show() ;                          
                          // Get.toNamed('/paymentPage');
                        },
                        child: Text(
                          '기부하기',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.black,
                          shadowColor: Colors.white,
                          elevation: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showDialog({@required String title, @required int index}) {
    String value = "";
    if (index != 0 && index != 1 && index != 2) return null;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text(title, style: designSet.getStyleDialogTitleText()),
          content: TextField(
            onChanged: (changedText) {
              value = changedText;
            },
            keyboardType: index == 0
                ? TextInputType.name
                : index == 1
                    ? TextInputType.phone
                    : index == 2
                        ? TextInputType.text
                        : null,
          ),
          actions: <Widget>[
            CupertinoButton(
              child: Text("확인",
                  style: designSet.getStyleDialogButtonText(isPositive: true)),
              onPressed: () {
                SystemChrome.setEnabledSystemUIOverlays([]);
                FocusScope.of(context).unfocus(); //  활성화 상태인 키보드 끄기.
                Navigator.pop(context);
                setState(() {
                  switch (index) {
                    case 0:
                      nameText = value;
                      break;
                    case 1:
                      phoneText = value;
                      break;
                    case 2:
                      affiliationText = value;
                      break;
                  }
                });
              },
            ),
            CupertinoButton(
              child: Text("취소",
                  style: designSet.getStyleDialogButtonText(isPositive: false)),
              onPressed: () {
                SystemChrome.setEnabledSystemUIOverlays([]);
                FocusScope.of(context).unfocus(); //  활성화 상태인 키보드 끄기.
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
