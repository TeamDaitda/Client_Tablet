import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class AnimatedLiquidLinearProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      AnimatedLiquidLinearProgressIndicatorState();
}

class AnimatedLiquidLinearProgressIndicatorState
    extends State<AnimatedLiquidLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );

    _animationController.addListener(() => setState(() {}));
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final percentage = _animationController.value * 100;
    return Center(
      child: Container(
        width: 1000,
        height: 30.0,
        padding: EdgeInsets.symmetric(horizontal: 1.0),
        child: LiquidLinearProgressIndicator(
          value: 0.5,
          backgroundColor: Colors.white,
          valueColor: AlwaysStoppedAnimation(Colors.black87),
          borderRadius: 12.0,
        ),
      ),
    );
  }
}
