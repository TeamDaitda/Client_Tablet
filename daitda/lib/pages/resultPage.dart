import 'dart:convert';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:daitda/controller/imageController.dart';
import 'package:daitda/controller/progress.dart';
import 'package:daitda/design/colorSet.dart';
import 'package:daitda/design/designSet.dart';
import 'package:daitda/model/outputModel.dart';
import 'package:daitda/pages/drawPage.dart';
import 'package:daitda/service/fileUploadApi.dart';
import 'package:daitda/service/imageTransApi.dart';
import 'package:daitda/service/paintService.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:ui' as ui;
import 'package:daitda/UIComponent/UIComponents.dart' as UICOMPONENTS;

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final designSet = Get.put(DesignSet());
  final progressData = Get.put(ProgressData());
  final colorSet = ColorSet();

  static double thisPageIndex;
  static double thisPageProgressIndex;

  List<OutPut> drawImage;
  ImageTransApi imageAPI = ImageTransApi();
  final imageController = Get.put(ImageController());

  GlobalKey _globalKey = new GlobalKey();
  XFile file;

  FileUploadApi _fileUploadApi = new FileUploadApi();

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
    print("result page -----");
    print("print path + name :" + file.path + file.name);
    return Container(
      width: designSet.getPaymentAreaWidth(),
      height: designSet.getPaymentAreaHeight(),
      color: colorSet.mainAreaColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder(
              future:
                  imageAPI.transImage(filePath: file.path, fileName: file.name),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData == false) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: TextStyle(fontSize: 15),
                    ),
                  );
                } else {
                  return Column(
                    children: [
                      Container(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.black,
                            shadowColor: Colors.white,
                          ),
                          child: Text('포토카드 받기'),
                          onPressed: () async {
                            final Uint8List data = await _capturePng();
                            _fileUploadApi
                                .upload(data: data)
                                .then((value) => print(value));

                            await Navigator.of(context).push(
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) {
                                  return Scaffold(
                                    appBar: AppBar(
                                      backgroundColor: Colors.black,
                                    ),
                                    body: Center(
                                      child: Container(
                                        color: Colors.grey,
                                        child: Image.memory(data),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            );
                          },
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
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    height: MediaQuery.of(context).size.height *
                                        0.6,
                                    width:
                                        MediaQuery.of(context).size.width * 0.6,
                                    child: Container(
                                      child: DrawPage(
                                        positionData: snapshot.data,
                                      ),
                                    ),
                                  ),
                                ),
                                // Align(
                                //   alignment: Alignment.bottomCenter,
                                //   child: Text(
                                //     "이름이름이름이름",
                                //     style: TextStyle(color: Colors.black),
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Text(
                        '당신의 선이 완성되었습니다.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  );
                }
              }),
        ],
      ),
    );
  }
}
