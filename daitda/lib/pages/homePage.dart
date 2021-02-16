import 'package:daitda/pages/categoryPage.dart';
import 'package:daitda/pages/galleryPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2C2F33),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            
            TextLiquidFill(
              text: 'DAITDA',
              waveColor: Colors.white,
              boxBackgroundColor: Color(0xff2C2F33),
              textStyle: TextStyle(
                fontSize: 80.0,
                fontWeight: FontWeight.bold,
              ),
            ),



          SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('gallery', style: TextStyle(fontSize: 16)),
                color: const Color(0xffb74093),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return GalleryPage();
                  }));
                },
              ),

              FlatButton(
                child: Text('start', style: TextStyle(fontSize: 16)),
                color: const Color(0xffb74093),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute<void>(builder: (BuildContext context) {
                    return CategoryPage();
                  }));
                },
              ),

            ],
          )
        ],
      ),
      );
  }
}
class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Row(children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40),
                  child: Text('hello'),
                ),
              ]),
            ),
          ],
        )
        );
  }
}






