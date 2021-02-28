import 'package:daitda/CurvePainter.dart';

import 'package:daitda/UIComponent/UIComponents.dart' as uiComponents;

import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            uiComponents.UIComponent().buildHeightSizedBox(50),
            uiComponents.UIComponent().renderTopStateBar(4),
            uiComponents.UIComponent().buildHeightSizedBox(50),
            _buildCenter("촬영 페이지", context),
          ],
        ),
      ),
    );
  }

  Widget _buildCenter(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        uiComponents.UIComponent().renderNavigationButton(option: 'back'),
        Container(
          // color: Color(0xfff6f5f5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              uiComponents.UIComponent().renderTitleText(title),
              Container(
                color: Color(0xfff6f5f5),
                width: 1000,
                height: MediaQuery.of(context).size.height - 229,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[],
                ),
              ),
            ],
          ),
        ),
        uiComponents.UIComponent()
            .renderNavigationButton(option: 'go', router: '/resultPage'),
      ],
    );
  }
}
