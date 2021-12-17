import 'package:daitda/controller/progress.dart';
import 'package:daitda/design/designSet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimatedLiquidLinearProgressIndicator extends StatefulWidget {
  @override
  State<StatefulWidget> createState() =>
      AnimatedLiquidLinearProgressIndicatorState();
}

class AnimatedLiquidLinearProgressIndicatorState
    extends State<AnimatedLiquidLinearProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  final designSet = Get.put(DesignSet());
  final progressData = Get.put(ProgressData());

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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          width: designSet.getProgressBarWidth(),
          height: designSet.getProgressBarHeight(),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Stack(
            children: [
              LiquidLinearProgressIndicator(
                value: progressData.getData(),
                backgroundColor: Color(0xff2b2b2b),
                valueColor: AlwaysStoppedAnimation(Colors.white),
                borderRadius: 30.0,
              ),

          Center(
            child: SvgPicture.asset(
            'images/transparency2.svg',
        ),
          ),


            ],
          ),
        ),
      ),
    );
  }
}
