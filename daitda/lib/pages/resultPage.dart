import 'dart:convert';
import 'dart:typed_data';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:camera/camera.dart';
import 'package:daitda/controller/Category.dart';
import 'package:daitda/controller/Controllers.dart';
import 'package:daitda/controller/imageController.dart';
import 'package:daitda/controller/paintController.dart';
import 'package:daitda/controller/progress.dart';
import 'package:daitda/design/colorSet.dart';
import 'package:daitda/design/designSet.dart';
import 'package:daitda/model/ArgumentsDataModel.dart';
import 'package:daitda/model/outputModel.dart';
import 'package:daitda/pages/drawPage.dart';
import 'package:daitda/service/fileUploadApi.dart';
import 'package:daitda/service/imageApi.dart';
import 'package:daitda/service/imageTransApi.dart';
import 'package:daitda/service/paintService.dart';
import 'package:daitda/service/resultApi.dart';
import 'package:daitda/service/userService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:daitda/UIComponent/UIComponents.dart' as UICOMPONENTS;

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  //  Design Setting.
  final designSet = Get.put(DesignSet());
  final colorSet = ColorSet();

  //  Controller Setting.
  final progressData = Get.put(ProgressData());
  final categoryController = Get.put(Category());
  final userController = Get.put(UserController());
  final paintController = Get.put(PaintController());

  static double thisPageIndex;
  static double thisPageProgressIndex;

  List<OutPut> drawImage;

  ImageTransApi _imageTransAPI = new ImageTransApi();
  ImageApi _imageApi = new ImageApi();
  UserApi _userApi = new UserApi();
  FileUploadApi _fileUploadApi = new FileUploadApi();
  ResultApi _resultApi = new ResultApi();

  final imageController = Get.put(ImageController());

  GlobalKey _globalKey = new GlobalKey();
  XFile file;

  String name;

  ArgumentsData argumentsData;

  Future<Uint8List> _capturePng() async {
    try {
      RenderRepaintBoundary boundary =
          _globalKey.currentContext.findRenderObject();
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      Uint8List pngBytes = byteData.buffer.asUint8List();
      String bs64 = base64Encode(pngBytes);
      print(pngBytes);
      print(bs64);
      setState(() {});
      return pngBytes;
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  void initState() {
    designSet.setScreenWidthAndHeight(w: Get.size.width, h: Get.size.height);
    progressData.setData(0.2);
    file = imageController.getFile();
    thisPageIndex = 4;
    thisPageProgressIndex = 0.2 * (thisPageIndex + 1);
    progressData.setData(thisPageProgressIndex);
    argumentsData = Get.arguments;
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

  Widget renderPaymentArea() {
    return Container(
      width: designSet.getPaymentAreaWidth(),
      height: designSet.getPaymentAreaHeight(),
      color: colorSet.mainAreaColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          paintController.getPaintState() == true
              ? Container()
              : FutureBuilder(
                  future: _imageTransAPI.transImage(
                      filePath: file.path, fileName: file.name),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData == false) {
                      return Container(
                        height: 500,
                        child: Align(
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(width: 20.0, height: 100.0),
                              RotateAnimatedTextKit(
                                duration: Duration(milliseconds: 2000),
                                text: [
                                  "${userController.getName()} 기부자님에게 어울리는",
                                  "${userController.getName()} 기부자님을 그릴",
                                  "${userController.getName()} 기부자님의 선을"
                                ],
                                textStyle: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              SizedBox(width: 20.0, height: 100.0),
                              RotateAnimatedTextKit(
                                duration: Duration(milliseconds: 2000),
                                text: ["잉크를 찾는중", "붓을 고르는중", "열심히 잇는중"],
                                textStyle: TextStyle(
                                  fontSize: 30.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ],
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Error: 11',
                          style: TextStyle(fontSize: 15),
                        ),
                      );
                    } else {
                      if (paintController.getPaintState() == true) {
                        print("getPaintState == true");
                        return Container();
                      } else {
                        paintController.setPaintState(true);
                        return Column(
                          children: [
                            Text(
                              '당신의 선을 확인해보세요.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: RepaintBoundary(
                                key: _globalKey,
                                child: Container(
                                  width: Get.size.width * 0.6,
                                  height: Get.size.height * 0.6,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.6,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          child: Container(
                                            child: DrawPage(
                                              positionData: snapshot.data,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 43,
                            ),

                              Container(
                              child: OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  primary: Colors.white,
                                  backgroundColor: Colors.white,
                                  shadowColor: Colors.white,
                                ),
                                child: Text('포토카드 꾸미기',
                                style: TextStyle( color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold,),),
                                onPressed: () async {
                                  // 회원가입
                                  _userApi
                                      .save(
                                    affiliation: argumentsData.affiliation,
                                    category: argumentsData.category,
                                    name: argumentsData.name,
                                    phone: argumentsData.phone,
                                  )
                                      .then((value) {
                                    argumentsData.id = value;
                                  });

                                  final Uint8List data = await _capturePng();
                                  argumentsData.data = data;
                                  _fileUploadApi
                                      .upload(data: data)
                                      .then((value) {
                                    _imageApi
                                        .save(path: value, id: argumentsData.id)
                                        .then((_) {
                                      _resultApi
                                          .save(id: argumentsData.id)
                                          .then((_) {
                                        Get.offAllNamed('/photoCardPage',
                                            arguments: argumentsData);
                                      });
                                    });
                                  });
                                },
                              ),
                            ),

                          ],
                        );
                      }
                    }
                  }),
        ],
      ),
    );
  }
}
