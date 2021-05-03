import 'package:flutter/material.dart';
import 'package:daitda/gallerysection/introduction.dart';
import 'package:daitda/gallerysection/scoreboard.dart';
import 'package:daitda/gallerysection/showcase.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  Size displaySize;

  @override
  Widget build(BuildContext context) {
     displaySize = MediaQuery.of(context).size;
       return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IntroDuction(),
            ShowCase(),
            ScoreBoard(),
          ],
        ),
      ),
    );
  }
}