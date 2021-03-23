import 'package:daitda/controller/Controllers.dart' as CONTROLLERS;
import 'package:daitda/UIComponent/UIComponents.dart' as UICOMPONENTS;
import 'package:daitda/design/designs.dart' as DESIGNS;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final designSet = Get.put(DESIGNS.DesignSet());
  final progressData = Get.put(CONTROLLERS.ProgressData());
  final colorSet = DESIGNS.ColorSet();

  TextEditingController nameTextFieldController = TextEditingController();
  String nameText;
  String phoneText;
  String affiliationText;
  TextEditingController affiliationTextFieldController =
      TextEditingController();

  CONTROLLERS.CategoryMember thisCategoryMember;

  @override
  void initState() {
    thisCategoryMember = Get.arguments;
    designSet.setScreenWidthAndHeight(w: Get.size.width, h: Get.size.height);

    nameText = "홍길동";
    phoneText = "010-1234-5678";
    affiliationText = "OO대학교";

    progressData.setData(0.2);
    super.initState();
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
            index: 1,
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
          child: FlatButton(
            child: Text(thisCategoryMember.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                )),
            color: Colors.white,
            onPressed: () {
              Get.toNamed('/paymentPage');
            },
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
          width: 0.5,
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
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 160, horizontal: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "이름을 알려주세요.",
                  style: TextStyle(
                    fontSize: 28,
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
                    _showDialog(title: "이름을 알려주세요.", index: 0);
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
                    fontSize: 28,
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
                    width: 300,
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
                  "소속을 입력해주세요.",
                  style: TextStyle(
                    fontSize: 28,
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
                    _showDialog(title: "소속을 입력해주세요.", index: 2);
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
                //이 곳 버튼
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
