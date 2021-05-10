import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IntroDuction extends StatefulWidget {
  @override
  _IntroDuctionState createState() => _IntroDuctionState();
}

class _IntroDuctionState extends State<IntroDuction> {
  Size displaySize;

  @override
  Widget build(BuildContext context) {
    displaySize = MediaQuery.of(context).size;

    return Container(
      width: displaySize != null ? displaySize.width  : 0,
      height: displaySize != null ? displaySize.height * 0.2 : 0,
      child: Container(
            alignment: Alignment.center,
            child: Image.asset('images/logo.gif',
            width: 280,
            height: 280,
            ),
            // child: Text('DaitDa',
            // style: TextStyle(color: Colors.white,
            // fontSize: 60,)
            // ),
          ),
    );
  }
}