import 'package:auto_size_text/auto_size_text.dart';
import 'package:daitda/UIComponent/snackBar.dart';
import 'package:daitda/controller/Controllers.dart' as CONTROLLERS;
import 'package:daitda/UIComponent/UIComponents.dart' as UICOMPONENTS;
import 'package:daitda/design/designs.dart' as DESIGNS;
import 'package:daitda/model/ArgumentsDataModel.dart';
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

class _InputPageState extends State<InputPage> with TickerProviderStateMixin {
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
  String dropdownValue = 'one';

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

  /// 기부하기 버튼 누를 시 애니메이션 출력용
  /// 1. SLIDE ANIMATION
  AnimationController _animationController;
  Animation _animationToRight;
  Animation _animationToLeft;
  Animation<double> curve;

  /// 2. FLIP ANIMATION
  AnimationController _flipAnimationController;
  Animation<double> _frontScale;
  Animation<double> _backScale;

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
    affiliationText = "학생";

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

    // SLIDE Animation 전용 초기화
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    curve =
        CurvedAnimation(parent: _animationController, curve: Curves.decelerate);
    _animationToRight =
        Tween<Offset>(begin: Offset(0, 0), end: Offset(0.551, 0))
            .animate(curve);
    _animationToLeft = Tween<Offset>(begin: Offset(0, 0), end: Offset(-0.55, 0))
        .animate(curve);

    // FLIP Animation 전용 초기화
    _flipAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    _frontScale = new Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(new CurvedAnimation(
      parent: _flipAnimationController,
      curve: new Interval(0.0, 0.5, curve: Curves.easeIn),
    ));
    _backScale = new CurvedAnimation(
      parent: _flipAnimationController,
      curve: new Interval(0.5, 1.0, curve: Curves.easeOut),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      SnackBarComponent.inputPageIntro(context);
    });

    super.initState();

    // Google AdMob 관련 초기화
    myInterstitial = InterstitialAd(
      adUnitId: 'ca-app-pub-3940256099942544/5135589807',
      request: AdRequest(),
      listener: AdListener(
        onAdLoaded: (ad) {
          setState(() {
            hasFailed = false;
          });
        },
        onAdClosed: (ad) {
          Get.offAllNamed(
            '/paymentPage',
            arguments: new ArgumentsData(
              -1,
              userController.getName(),
              userController.getPhone(),
              userController.getAffiliation(),
              thisCategoryMember.id,
            ),
          );
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
  void dispose() {
    _flipAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: colorSet.backgroundColor,
      body: SafeArea(
        child: Container(
          child: Row(
            children: [
              Column(
                children: [
                  renderLogoArea(),
                  renderProgressArea(),
                ],
              ),
              Container(
                width: designSet.getInputAreaWidth() +
                    designSet.getInputcardAreaWidth(),
                child: Stack(
                  children: [
                    Positioned(
                      right: 0,
                      child: renderInputArea(),
                    ),
                    Stack(
                      children: [
                        AnimatedBuilder(
                          child: renderInputCardAreaBack(),
                          animation: _backScale,
                          builder: (BuildContext context, Widget child) {
                            final Matrix4 transform = new Matrix4.identity()
                              ..scale(1.0, _backScale.value, 1.0);
                            return new Transform(
                              transform: transform,
                              alignment: FractionalOffset.center,
                              child: child,
                            );
                          },
                        ),
                        AnimatedBuilder(
                          child: renderInputcardArea(),
                          animation: _frontScale,
                          builder: (BuildContext context, Widget child) {
                            final Matrix4 transform = new Matrix4.identity()
                              ..scale(1.0, _frontScale.value, 1.0);
                            return new Transform(
                              transform: transform,
                              alignment: FractionalOffset.center,
                              child: child,
                            );
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
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
        color: colorSet.inputcardAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
        ),
      ),
      width: designSet.getInputcardAreaWidth(),
      height: designSet.getInputcardAreaHeight(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SlideTransition(
          position: _animationToRight,
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
                    padding: const EdgeInsets.only(top: 40),
                    child: AutoSizeText(
                      "${thisCategoryMember.getTitle()}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 80, left: 20, right: 20),
                    child: Container(
                      height: 20,
                      child: AutoSizeText(
                        '${thisCategoryMember.getsubTitle()}',
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
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
      ),
    );
  }

  Widget renderInputCardAreaBack() {
    return Container(
        width: designSet.getInputAreaWidth(),
        height: designSet.getInputAreaHeight(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SlideTransition(
            position: _animationToRight,
            child: Container(
              decoration: BoxDecoration(
                color: colorSet.cardBackColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "To. ${thisCategoryMember.getTitle()}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SvgPicture.asset(
                    'images/text.svg',
                    width: 110,
                    height: 110,
                  ),
                  Text(
                    "From. ${nameText}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget renderInputArea() {
    return Container(
      key: ValueKey(true),
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
        child: SlideTransition(
          position: _animationToLeft,
          child: Container(
            decoration: BoxDecoration(
                color: colorSet.mainCardMackgroundcolor,
                borderRadius: BorderRadius.circular(20)),
            child: SingleChildScrollView(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
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
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "결과물에 기부자님의 성함이 기재됩니다.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
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
                              width: 1,
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
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "결과물에 기부자님의 연락처가 기재됩니다.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
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
                              width: 1,
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
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "결과물에 기부자님의 직업이 기재됩니다.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
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
                              width: 1,
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
                    const SizedBox(
                      height: 5,
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
                    Align(
                      alignment: Alignment.centerRight,
                      child: OutlinedButton(
                        onPressed: () {
                          if (nameText == "홍길동" ||
                              nameText == null ||
                              nameText == "") {
                            SnackBarComponent.inputPageTextFormName(context);
                          } else if (phoneText == "010-1234-5678" ||
                              phoneText == null ||
                              phoneText == "") {
                            SnackBarComponent.inputPageTextFormPhone(context);
                          } else {
                            // 애니메이션 실행
                            _flipAnimationController.forward().whenComplete(() {
                              _animationController.forward().whenComplete(() {
                                // 유저 컨트롤러에 입력받은 정보들을 저장합니다.
                                userController.setName(name: nameText); // 이름
                                userController.setAffiliation(
                                    affiliation: affiliationText); // 소속
                                userController.setPhone(
                                    phone: phoneText); // 휴대폰 번호
                                userController.setSelectedCategoryIndex(
                                    index:
                                        this.thisCategoryMember.id); // 카테고리 아이디

                                hasFailed
                                    ? Get.toNamed('/paymentPage')
                                    : myInterstitial.show();
                              });
                            });
                          }
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
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AutoSizeText(
                      '개인정보 수집·이용 동의\n이용자 확인을 위해 아래와 같이 개인정보를 수집·이용합니다.\n1.개인정보의 수집·이용 목적 : 이용자 확인 및 포토카드 출력\n2.수집하는 개인정보의 항목 : 이름,휴대폰번호, 소속 \n3.개인정보의 보유·이용기간 : 전시 종료 후 즉시 파기\n4.동의를 거부할 수 있으며, 이 경우 이후 서비스 이용이 제한됩니다.',
                      style: TextStyle(
                        fontSize: 5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
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
                    ? TextInputType.number
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
