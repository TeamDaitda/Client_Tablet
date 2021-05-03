import 'package:flutter/material.dart';

class ScoreBoard extends StatefulWidget {
  @override
  _ScoreBoardState createState() => _ScoreBoardState();
}

class _ScoreBoardState extends State<ScoreBoard> {
  Size displaySize;

  @override
  Widget build(BuildContext context) {
    displaySize = MediaQuery.of(context).size;

    return Container(
      width: displaySize != null ? displaySize.width : 0,
      height: displaySize != null ? displaySize.height * 0.1 : 0,
      child: Container(
        alignment: Alignment.center,
        child: Text('여긴 뭐가 나올까',
        style: TextStyle(color: Colors.black,),
        ),
      ),
    );
  }
}
