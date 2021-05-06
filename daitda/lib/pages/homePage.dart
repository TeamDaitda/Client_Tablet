import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
      body: Stack(
        children: <Widget>[
          
          Center(
            child: Opacity(
            child: SvgPicture.asset(
              'images/sym.svg',
              width:830,
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
                width:110,
                height:110,
              )
            ),
          ),

       
      
          Padding(
            padding: const EdgeInsets.fromLTRB(0,420, 0, 0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    'Draw your line,',
                    style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),

                Text(
                    'Makes our life,',
                    style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
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
                       child: Text('갤러리',style: TextStyle(
                         fontSize: 20,
                         color: Colors.white,
                       ),),
                       style: OutlinedButton.styleFrom(
                         primary: Colors.white,
                         backgroundColor: Colors.black,
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
                       child: Text('시작하기',style: TextStyle(
                         fontSize: 20,
                         color: Colors.white,
                       ),),
                       
                       style: OutlinedButton.styleFrom(
                         primary: Colors.white,
                         backgroundColor: Colors.black,
                         shadowColor: Colors.black,
                         elevation: 8,
                       ),
                       
                       ),

                  ],
                )
              ],
        ),
      ),
    )
          
        ],
      ),
    );
  }
}







