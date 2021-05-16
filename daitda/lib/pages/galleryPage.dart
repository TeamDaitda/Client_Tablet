import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:daitda/controller/Category.dart';
import 'package:daitda/design/shadowSet.dart';
import 'package:daitda/model/result/resultGetAllDto.dart';
import 'package:daitda/service/resultApi.dart';
import 'package:daitda/service/userService.dart';
import 'package:flutter/material.dart';
import 'package:daitda/gallerysection/introduction.dart';
import 'package:daitda/gallerysection/scoreboard.dart';
import 'package:daitda/gallerysection/showcase.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:path/path.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  CategoryService _categoryService = new CategoryService();

  UserApi _userApi = new UserApi();
  ResultApi _resultApi = new ResultApi();

  int itemLength;
  List<Result> resultData;
  Size displaySize;

  bool flag;

  int goal = 500;
  int now = 0;
  double progress;
  @override
  void initState() {
    flag = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    displaySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: _resultApi.getAll(),
                  builder: (BuildContext context,
                      AsyncSnapshot<ResultGetAllDto> snapshot) {
                    if (snapshot.hasData == false) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Error: ${snapshot.error}'),
                      );
                    } else {
                      List<Result> data = snapshot.data.result;
                      return Swiper(
                        viewportFraction: 0.5,
                        autoplay: true,
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          int reverseIndex = data.length - 1 - index;
                          // 끝번일 경우
                          if (reverseIndex == data.length - 1 && flag == true) {
                            if (flag) {
                              Future.delayed(Duration.zero, () async {
                                _resultApi.getAll().then((value) {
                                  if (value.result.length != data.length) {
                                    Get.offAllNamed('/galleryPage');
                                  }
                                });
                                flag = false;
                              });
                            }
                          } else if (reverseIndex == 0) {
                            Future.delayed(Duration.zero, () async {
                              flag = true;
                            });
                          }
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CachedNetworkImage(
                                placeholder: (context, url) => Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: CircularProgressIndicator(),
                                ),
                                imageUrl: data[reverseIndex].path,
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              Text(
                                data[reverseIndex].id.toString() + "번째 기부자",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                _categoryService.indexToCategory(
                                    data[reverseIndex].category),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                data[reverseIndex].name,
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ),
              FutureBuilder(
                future: _resultApi.getAll(),
                builder: (BuildContext context,
                    AsyncSnapshot<ResultGetAllDto> snapshot) {
                  if (snapshot.hasData == false) {
                    return CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    now = snapshot.data.result.length;
                    progress = (now / 5) * 0.01;
                    print(progress);
                    return Column(
                      children: [
                        Text(
                          "목표까지 ${goal - now}km",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '0km',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Center(
                                child: Container(
                                  width: 600,
                                  height: 20,
                                  child: LiquidLinearProgressIndicator(
                                    value: progress,
                                    valueColor: AlwaysStoppedAnimation(
                                      Colors.black,
                                    ),
                                    borderColor: Colors.black,
                                    backgroundColor: Colors.white,
                                    borderWidth: 0.0,
                                    borderRadius: 10.0,
                                    direction: Axis.horizontal,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20,
                              ),
                              Text(
                                '${goal}km',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black,
                  boxShadow: ShadowSet.shadow(),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: AutoSizeText(
                    "뒤로가기",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
