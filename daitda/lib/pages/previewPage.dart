import 'dart:io';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as pt;
import 'package:get/get.dart';
import 'dart:math' as math;
import 'dart:async';

class PreviewPage extends StatefulWidget {
  final String imgPath;
  PreviewPage({this.imgPath});
  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  int selectedCameraIndex;
  List cameras;

  @override
  void initState() {
    super.initState();
    availableCameras().then((availableCameras) {
      cameras = availableCameras;

      if (cameras.length > 0) {
        setState(() {
          selectedCameraIndex = 1;
        });
      } else {
        print('No camera available');
      }
    }).catchError((err) {
      print('Error :${err.code}Error message : ${err.message}');
    });
  }

  
   Widget build(BuildContext context) {
     final double mirror = selectedCameraIndex == 1 ? math.pi : 0 ;
     return Scaffold(
      body:Container(
        child: Stack(
          children: [
            Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(mirror),
              child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Image.file(File(widget.imgPath),fit: BoxFit.cover,),
                    ),
                  ],
                ),
            ),
            
            Center(
              child: Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/cameraPage');
                    },
                    child: Text('다시찍기',style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),

                  SizedBox(
                    width: 20,
                  ),

                   TextButton(
                    onPressed: () {
                      Get.toNamed('/resultPage');
                    },
                    child: Text('결과보기',style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    ),
                  ),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}