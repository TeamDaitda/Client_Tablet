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
  //  Design Setting.
  final designSet = Get.put(DESIGNS.DesignSet());
  final colorSet = DESIGNS.ColorSet();

  //  Controller Setting.
  final progressData = Get.put(CONTROLLERS.ProgressData());
  final userController = Get.put(CONTROLLERS.UserController());
  final categoryController = Get.put(CONTROLLERS.Category());

  /*
   * 사용자가 선택한 카테고리.
   * 
   * Categories selected by user.
   */
  CONTROLLERS.CategoryMember thisCategoryMember;

  /*
   * 현재 페이지의 인덱스와 이를 바탕으로 계산될 프로그래스의 인덱스입니다.
   * 
   * The index of the current page and the progress that will be calculated based on it.
   */
  static double thisPageIndex;
  static double thisPageProgressIndex;

  @override
  void initState() {
    /*
     * 현재 페이지의 인덱스.
     * 
     * The index of the current page.
     */
    thisPageIndex = 0;
    thisPageProgressIndex = 0.2 * (thisPageIndex + 1);

    /*
     * 사용자가 선택한 카테고리를 '0' 인덱스로 초기화합니다.
     * 
     * Initialize user selected category to '0' index.
     */
    thisCategoryMember = categoryController.categoryMember[0];

    /*
     * 사용된 클라이언트의 표시를 기준으로 높이와 너비를 초기화합니다.
     * 
     * Initialize the height and width based on the display of the client used.
     */
    designSet.setScreenWidthAndHeight(w: Get.size.width, h: Get.size.height);

    /*
     * 현재 페이지의 인덱스를 사용하여 구성합니다.
     * 
     * Configure using the index on the current page.
     */
    progressData.setData(thisPageProgressIndex);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*
     * 풀 스크린모드로 전환합니다.
     * 
     * Switch to full screen mode.
     */
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
          'images/sym.svg',
          width: 10,
          height: 10,
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
            index: thisPageIndex.toInt(),
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
            child: Text(
              thisCategoryMember.toString(),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            color: Colors.white,
            onPressed: () {
              /*
               * inputPage로 이동하며 선택한 카테고리의 대한 정보를 arguments로 전달합니다.
               * 
               * Go to InputPage and pass information about the selected category.
               */
              userController.setSelectedCategoryIndex(index: thisCategoryMember.id);
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
                  setState(
                    () {
                      /*
                     * 사용자가 카테고리를 탭하면 카테고리의 정보가 현재 선택된 카테고리에 배치됩니다.
                     * 
                     * When a user tabs a category,
                     * the information in the category
                     * is placed in the currently selected category.
                     */
                      thisCategoryMember = CONTROLLERS.CategoryMember(
                        id: categoryController.categoryMember[index].id,
                        title: categoryController.categoryMember[index].title,
                        body: categoryController.categoryMember[index].body,
                        imgUrl: categoryController.categoryMember[index].imgUrl,
                      );
                      print(
                          categoryController.categoryMember[index].toString());
                    },
                  );
                },
                child: Container(
                  width: 200,
                  decoration: BoxDecoration(
                    color: colorSet.mainCardMackgroundcolor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      /*
                       * 카테고리의 정보를 텍스트로 출력합니다.
                       * 
                       * Prints information of categories in Text.
                       */
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
