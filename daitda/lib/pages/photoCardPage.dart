
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
import 'package:intl/intl.dart';

class PhotoCardPage extends StatefulWidget {
  @override
  _PhotoCardPageState createState() => _PhotoCardPageState();
}

class _PhotoCardPageState extends State<PhotoCardPage> {
  final userController = Get.put(UserController());
  var _today = DateTime.now();

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
      backgroundColor: Color(0xff2b2b2b),
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
                        //포토카드
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
                          right: 30,
                          
                          child: Container(
                            width: 105,
                            height: 105,
                            child: Image.network(
                                "https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=http://15.164.195.117:8080/backend-0.0.1-SNAPSHOT/result/view/${argumentData.id}"),
                          ),
                        ),
                        Positioned(
                          width: 143,
                          left: 26,
                          bottom: 137,
                          child: Image.asset('images/photoCardLogo.png'),
                        ),
                        Positioned(
                          left: 26,
                          bottom: 85,
                          child: Text('당신의 아름다운 善을 보여주셔서 감사합니다.\n오늘도 선한 하루 되세요:)',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),),
                          ),

                         
                                //  Text(
                                //     data[reverseIndex].id.toString() + "번째 기부자",
                                //     style: TextStyle(
                                //       fontSize: 20,
                                //       color: Colors.white,
                                //     ),
                                //   ),

                      ],
                    ),
                  ),

                  //색상 팔레트
                  Positioned(
                    top: 8,
                    left: 530,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: ColorSet().backgroundColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          //팔레트 위치
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 170,
                            ),

                            child: Column(
                                children: [
                                  Text('거의 다 왔어요. \n마지막으로 색을 채워볼까요?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                  fontSize: 32, 
                                  color: Colors.white,
                                  //fontWeight: FontWeight.bold,
                                  ),),
                                  SizedBox(height: 40),
                                Row(
                                  children: [
                                    colorWidget(Colors.black),
                                    colorWidget(Color(0xffA2A4AB)),
                                    colorWidget(Color(0xff696A6E)),
                                    colorWidget(Color(0xff6F614C)),
                                    colorWidget(Color(0xff6F6761)),
                                    colorWidget(Color(0xff6F614C)),
                                    colorWidget(Color(0xffEBCDA0)),
                                    colorWidget(Color(0xffF7D8A8)),
                                    colorWidget(Color(0xffD1CD9B)),

                                  

                                  ],
                                ),
                                  SizedBox(height: 30),
                                Row(
                                    children: [
                                      colorWidget(Color(0xff686BA1)),
                                      colorWidget(Color(0xff523B61)),
                                      colorWidget(Color(0xff9A9EED)),
                                      colorWidget(Color(0xff8184C7)),
                                      colorWidget(Color(0xff537AA3)),
                                      colorWidget(Color(0xff314861)),
                                      colorWidget(Color(0xff72A8E0)),
                                      colorWidget(Color(0xff91AEB5)),
                                      colorWidget(Color(0xff6595C7)),
                                    ],
                                ),

                                SizedBox(height: 30),

                                      Row(
                                    children: [
                                      colorWidget(Color(0xff6FA199)),
                                      colorWidget(Color(0xff43615C)),
                                      colorWidget(Color(0xffA4EDE2)),
                                      colorWidget(Color(0xff89C7BE)),
                                      colorWidget(Color(0xff76A370)),
                                      colorWidget(Color(0xff466143)),
                                      colorWidget(Color(0xffA3E09B)),
                                      colorWidget(Color(0xffD2DDBA)),
                                      colorWidget(Color(0xff90C789)),
                                    ],
                                ),

                                SizedBox(height: 30),
                                      Row(
                                    children: [
                                      colorWidget(Color(0xffA3A15D)),
                                      colorWidget(Color(0xff616037)),
                                      colorWidget(Color(0xffEDEA87)),
                                      colorWidget(Color(0xffC7C471)),
                                      colorWidget(Color(0xffA3605C)),
                                      colorWidget(Color(0xff613836)),
                                      colorWidget(Color(0xffE0837E)),
                                      colorWidget(Color(0xffDEA795)),
                                      colorWidget(Color(0xffC7746F)),
                                  
                                    ],
                                ),
                                SizedBox(
                                  height: 30
                                ),

                                Row(
                                    children: [
                                      colorWidget(Color(0xffAB637F)),
                                      colorWidget(Color(0xffEB88AE)),
                                      colorWidget(Color(0xff704153)),
                                      colorWidget(Color(0xff362631)),
                                      colorWidget(Color(0xff9AA6B8)),
                                      colorWidget(Color(0xff636A75)),
                                      colorWidget(Color(0xffCEDDF5)),
                                      colorWidget(Color(0xffACB5AF)),
                                      colorWidget(Color(0xff6D736F)),
                                  
                                    ],
                                ),

                                  SizedBox(
                                  height: 16
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        p.changeEraseMode();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 380),
                                        child: Text(
                                          '지우개',
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: p.eraseMode
                                                  ? FontWeight.w900
                                                  : FontWeight.w100),
                                        ),
                                      ),
                                    ),
                                  ]
                                )
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),



                  ),
                  Positioned(
                    right: 40,
                    bottom: 30,
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
                          child: Text("포토카드 받기",
                          style: TextStyle(fontWeight: FontWeight.w700,color: Colors.black),),
                          style: OutlinedButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.white,
                            
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
      padding: const EdgeInsets.only(right: 3),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          p.changeColor = color;
        },
        child: Container(
          width: 45,
          height: 40,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: p.color == color
                  ? Border.all(color: Colors.white, width: 3)
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
