import 'dart:typed_data';
import 'dart:convert';

import 'package:daitda/controller/user.dart';
import 'package:daitda/design/designs.dart';
import 'package:daitda/model/ArgumentsDataModel.dart';
import 'package:daitda/service/DrawingService/DotInfo.dart';
import 'package:daitda/service/DrawingService/DrawingProvider.dart';
import 'package:daitda/service/fileUploadApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'dart:ui' as ui;

class PhotoCardPage extends StatefulWidget {
  @override
  _PhotoCardPageState createState() => _PhotoCardPageState();
}

class _PhotoCardPageState extends State<PhotoCardPage> {
  final userController = Get.put(UserController());

  ArgumentsData argumentData;
  GlobalKey _globalKey = new GlobalKey();
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
    super.initState();
    argumentData = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<DrawingProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Container(
        child: Row(
          children: [
            Expanded(
              child: Stack(
                children: [
                  RepaintBoundary(
                    key: _globalKey,
                    child: Stack(
                      children: [
                        Container(
                          width: 500,
                          height: 700,
                          color: Colors.white,
                          child: Stack(
                            children: [
                              Positioned(
                                width: 500,
                                bottom: 250,
                                child: Center(
                                  child: Image.memory(argumentData.data),
                                ),
                              ),
                              CustomPaint(
                                painter: DrawingPainter(p.lines),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 80,
                          left: 210,
                          child: Container(
                            width: 80,
                            height: 80,
                            child: Image.network(
                                "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=http://15.164.195.117:8080/backend-0.0.1-SNAPSHOT/result/view/${argumentData.id}"),
                          ),
                        ),
                        Positioned(
                          width: 80,
                          left: 210,
                          bottom: 30,
                          child: Image.asset('images/photoCardLogo.png'),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ColorSet().backgroundColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                colorWidget(Colors.black),
                                colorWidget(Colors.deepOrange),
                                colorWidget(Colors.deepPurple),
                                colorWidget(Colors.lightGreen),
                                colorWidget(Colors.pink),
                                colorWidget(Colors.yellow),
                                colorWidget(Colors.green),
                                colorWidget(Colors.blue),
                                GestureDetector(
                                  behavior: HitTestBehavior.translucent,
                                  onTap: () {
                                    p.changeEraseMode();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      '지우개',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: p.eraseMode
                                              ? FontWeight.w900
                                              : FontWeight.w100),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    bottom: 10,
                    child: Row(
                      children: [
                        OutlinedButton(
                          onPressed: () async {
                            final Uint8List data = await _capturePng();

                            // 인쇄를 위한 사진 저장
                            _fileUploadApi
                                .upload(data: data)
                                .then((value) => print(value));

                            Get.offAllNamed('/homePage');
                          },
                          child: Text("포토카드 받기"),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: ColorSet().backgroundColor,
                            shadowColor: Colors.white,
                            elevation: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onPanStart: (s) {
                      if (p.eraseMode) {
                        p.erase(s.localPosition);
                      } else {
                        p.drawStart(s.localPosition);
                      }
                    },
                    onPanUpdate: (s) {
                      if (p.eraseMode) {
                        p.erase(s.localPosition);
                      } else {
                        p.drawing(s.localPosition);
                      }
                    },
                    child: Container(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget colorWidget(Color color) {
    var p = Provider.of<DrawingProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          p.changeColor = color;
        },
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: p.color == color
                  ? Border.all(color: Colors.white, width: 4)
                  : null,
              color: color),
        ),
      ),
    );
  }
}

class DrawingPainter extends CustomPainter {
  DrawingPainter(this.lines);
  final List<List<DotInfo>> lines;
  @override
  void paint(Canvas canvas, Size size) {
    for (var oneLine in lines) {
      Color color;
      double size;
      var l = <Offset>[];
      var p = Path();
      for (var oneDot in oneLine) {
        color ??= oneDot.color;
        size ??= oneDot.size;
        l.add(oneDot.offset);
      }
      p.addPolygon(l, false);
      canvas.drawPath(
          p,
          Paint()
            ..color = color
            ..strokeWidth = size
            ..strokeCap = StrokeCap.round
            ..style = PaintingStyle.stroke);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
