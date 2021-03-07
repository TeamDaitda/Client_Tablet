import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as pt;
import 'package:get/get.dart';
import 'dart:math' as math;

class PreviewPage extends StatefulWidget {
  final String imgPath;
  PreviewPage({this.imgPath});

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.file(File(widget.imgPath),fit: BoxFit.cover,),
            ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
          FlatButton(
            child: Text('camera',style: TextStyle(
              fontSize: 16,
              color: Colors.white,)),

              color: Colors.black,
              onPressed: (){
                Get.toNamed('/cameraPage');
              },
          ), 
          
          SizedBox(
          width: 30.0,
          ),

           FlatButton(
                child: Text('start', style: TextStyle(
                fontSize: 16,
                color: Colors.white,)),
                color: Colors.black,
                onPressed: () {
                  Get.toNamed('/categoryPage');
                },
              ),

          ],
          )
            
          ],
        ),
      ),
    );
  }
  }
