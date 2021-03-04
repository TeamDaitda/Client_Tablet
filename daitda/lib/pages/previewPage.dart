import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart' as pt;
import 'package:get/get.dart';

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
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Image.file(File(widget.imgPath),fit: BoxFit.cover,),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                height: 60.0,
                color: Colors.black,
                child: Center(
                  child: IconButton(
                    icon: Icon(Icons.share,color: Colors.white,),
                    onPressed: (){
                      Get.toNamed('/galleryPage');
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  }
