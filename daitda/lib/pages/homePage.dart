import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:daitda/design/designs.dart';
import 'package:daitda/pages/categoryPage.dart';
import 'package:daitda/pages/galleryPage.dart';
import 'package:daitda/service/adApi.dart';
import 'package:daitda/service/imageApi.dart';
import 'package:daitda/service/userService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // http test
  UserApi userApi = new UserApi();
  ImageApi imageApi = new ImageApi();
  AdApi adApi = new AdApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorSet().backgroundColor,
      body: Stack(
        children: <Widget>[
          Center(
            child: Opacity(
              child: SvgPicture.asset(
                'images/sym.svg',
                width: 830,
                height: 830,
              ),
              opacity: 0.05,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 100),
            child: Center(
                child: SvgPicture.asset(
              'images/text.svg',
              width: 110,
              height: 110,
            )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 420, 0, 0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Draw your line,',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Make our life.',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Get.toNamed('/galleryPage');
                        },
                        child: Text(
                          '갤러리',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.white,
                          shadowColor: Colors.black,
                          elevation: 8,
                        ),
                      ),
                      SizedBox(
                        width: 29.0,
                      ),
                      OutlinedButton(
                        onPressed: () {
                          Get.toNamed('/categoryPage');
                        },
                        child: Text(
                          '시작하기',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        style: OutlinedButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.white,
                          shadowColor: Colors.black,
                          elevation: 8,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30, right: 30, left: 30),
              child: Column(
                children: [
                  Image.asset(
                    'images/apply.png',
                    width: 110,
                    height: 110,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '다잇다와 함께 하기',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
