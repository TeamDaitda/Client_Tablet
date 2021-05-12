import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

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
      child: Stack(
          children: [
        Align(
          alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text('목표까지 32.034km 남았습니다.',
          style: TextStyle(color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold,),
          ),
              ),
        ),
        
        Center(     
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              width: 600,
              height: 20,
              child: LiquidLinearProgressIndicator(
                value: 0.1,
                valueColor: AlwaysStoppedAnimation(Colors.white,),
                borderColor: Colors.black,
                backgroundColor: Colors.black,
                borderWidth: 0.0,
                borderRadius: 10.0,
                direction: Axis.horizontal,
              ),
            ),
          ),
        ),

      Padding(
        padding: const EdgeInsets.only(top:63),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:220,),
              child: Text('0km',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              )),
            ),

            Padding(
              padding: const EdgeInsets.only(left:615,),
              child: Text('40,075km',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
              ),
              ),
            ),


          ],
          ),
      ),


          ],
      ),
    );
  }
}
