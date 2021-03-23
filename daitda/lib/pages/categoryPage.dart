import 'package:daitda/controller/Controllers.dart' as CONTROLLERS;
import 'package:daitda/UIComponent/UIComponents.dart' as UICOMPONENTS;
import 'package:daitda/design/designs.dart' as DESIGNS;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final designSet = Get.put(DESIGNS.DesignSet());
  final colorSet = DESIGNS.ColorSet();

  final progressData = Get.put(CONTROLLERS.ProgressData());

  final userController = Get.put(CONTROLLERS.UserController());
  final categoryController = Get.put(CONTROLLERS.Category());

  CONTROLLERS.CategoryMember thisCategoryMember;

  @override
  void initState() {
    thisCategoryMember = categoryController.categoryMember[0];

    designSet.setScreenWidthAndHeight(w: Get.size.width, h: Get.size.height);
    progressData.setData(0.2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Column(
              children: [
                renderLogoArea(),
                renderProgressArea(),
              ],
            ),
            Column(
              children: [
                renderMainArea(),
                renderBottomArea(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget renderLogoArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.logoAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
        ),
      ),

      child: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: SvgPicture.asset(
                  'images/test.svg',
                  width:10,
                  height:10,
                ),
      ),
      width: designSet.getLogoAreaWidth(),
      height: designSet.getLogoAreaHeight(),
    );
  }

  Widget renderProgressArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.progressAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
        ),
      ),
      width: designSet.getProgressAreaWidth(),
      height: designSet.getProgressAreaHeight(),
      child: Column(
        children: [
          UICOMPONENTS.AnimatedLiquidLinearProgressIndicator(),
          UICOMPONENTS.ProcessBar(
            index: 0,
          ),
        ],
      ),
    );
  }

  Widget renderMainArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.mainAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
        ),
      ),
      width: designSet.getMainAreaWidth(),
      height: designSet.getMainAreaHeight(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: colorSet.mainCardMackgroundcolor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: FlatButton(
            child: Text(thisCategoryMember.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                )),
            color: Colors.white,
            onPressed: () {
              Get.toNamed('/inputPage', arguments: thisCategoryMember);
            },
          ),
        ),
      ),
    );
  }

  Widget renderBottomArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.bottomAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
        ),
      ),
      width: designSet.getBottomAreaWidth(),
      height: designSet.getBottomAreaHeight(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: InkWell(
                onTap: () {
                  setState(() {
                    thisCategoryMember = CONTROLLERS.CategoryMember(
                      id: categoryController.categoryMember[index].id,
                      title: categoryController.categoryMember[index].title,
                      body: categoryController.categoryMember[index].body,
                      imgUrl: categoryController.categoryMember[index].imgUrl,
                    );
                    print(categoryController.categoryMember[index].toString());
                  });
                },
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: colorSet.mainCardMackgroundcolor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "${categoryController.categoryMember[index].id.toString()}\n${categoryController.categoryMember[index].toString()}",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: categoryController.categoryMember.length,
          pagination: null,
          control: null,
          viewportFraction: 0.30,
        ),
      ),
    );
  }
}
