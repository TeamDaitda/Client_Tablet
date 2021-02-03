import 'package:daitda/UIConponent/uiComponent.dart';
import 'package:daitda/design/colorSet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flip_card/flip_card.dart';

const List<String> titles = [
  "Pasicm",
  "Pollution",
  "Global Warming",
];
const List<String> imageUrls = [
  "images/ps.png",
  "images/pl.png",
  "images/gw.png",
];

class CategoryPage extends StatefulWidget {
  static const routeName = '/categoryPage';

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UIComponent().buildHeightSizedBox(50),
            UIComponent().renderTopStateBar(2),
            UIComponent().buildHeightSizedBox(50),
            _buildCenter("어떤 곳에 기부하고 싶으세요?", context),
          ],
        ),
      ),
    );
  }

  Widget _buildCenter(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        UIComponent().renderNavigationButton(option: 'back'),
        Container(
          // color: Color(0xfff6f5f5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIComponent().renderTitleText(title),
              Center(
                child: Container(
                  width: 1000,
                  height: MediaQuery.of(context).size.height - 229,
                  child: new Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return _buildCard(
                          title: titles[index],
                          img: AssetImage(imageUrls[index]),
                          context: context);
                    },
                    itemCount: 3,
                    viewportFraction: 0.6,
                    scale: 0.9,
                    indicatorLayout: PageIndicatorLayout.NONE,
                    autoplay: false,

                    pagination: new SwiperPagination(),
                    // control: new SwiperControl(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
        UIComponent()
            .renderNavigationButton(option: 'go', router: '/paymentPage'),
      ],
    );
  }

  Widget _buildCard({String title, AssetImage img, BuildContext context}) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlipCard(
              front: Container(
                width: 900,
                height: 400,
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 0,
                  child: Image(
                    image: img,
                  ),
                ),
              ),
              back: Container(
                width: 900,
                height: 400,
                child: Card(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 300,
                        child: FlatButton(
                          onPressed: () {
                            Get.toNamed('/paymentPage');
                          },
                          child: Text(
                            "선택하기",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          color: Color(0xffA7A7A7),
                        ),
                      ),
                      UIComponent().buildHeightSizedBox(30),
                      Container(
                        height: 100,
                        width: 300,
                        child: FlatButton(
                          onPressed: () {
                            _settingModalBottomSheet(context, title, img);
                          },
                          child: Text(
                            "더보기",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          color: Color(0xffA7A7A7),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                title,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context, title, img) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return DraggableScrollableSheet(
            initialChildSize: 0.6,
            builder: (BuildContext context, ScrollController scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10),
                      topRight: const Radius.circular(10),
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: FlatButton(
                          onPressed: () {},
                          child: Text("X"),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            title + "이란?",
                            style: TextStyle(fontSize: 50),
                          ),
                          Container(
                            width: 400,
                            height: 300,
                            child: Image(
                              image: img,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        // width: MediaQuery.of(context).size.width,
                        // height: MediaQuery.of(context).size.height,
                        width: 1000,
                        height: 1000,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
