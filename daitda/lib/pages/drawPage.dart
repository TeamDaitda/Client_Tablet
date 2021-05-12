import 'package:daitda/model/outputModel.dart';
import 'package:daitda/service/paintService.dart';
import 'package:flutter/material.dart';

class DrawPage extends StatefulWidget {
  final List<OutPut> positionData;
  const DrawPage({Key key, this.positionData}) : super(key: key);

  @override
  _DrawPageState createState() => _DrawPageState();
}

class _DrawPageState extends State<DrawPage>
    with SingleTickerProviderStateMixin {
  //  선을 그리기 위한 컨트롤러
  AnimationController _animationController;
  Animation<int> animation;
  int animationProgress;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(milliseconds: 10000), vsync: this);
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CurvePainter(
        // animationProgress: animationProgress,
        // input: widget.positionData,
        // displaySize: MediaQuery.of(context).size,
        _animationController, widget.positionData, MediaQuery.of(context).size,
      ),
    );
  }
}
