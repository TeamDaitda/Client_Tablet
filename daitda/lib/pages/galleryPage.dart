import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:daitda/model/result/resultGetAllDto.dart';
import 'package:daitda/service/resultApi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class GalleryPage extends StatefulWidget {
  @override
  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  ResultApi _resultApi = new ResultApi();

  int itemLength;
  List<Result> resultData;
  Size displaySize;

  bool isLoading;

  @override
  void initState() {
    super.initState();

    isLoading = false;
    Future.delayed(Duration.zero, () async {
      loadData();
    });
  }

  void loadData() {
    _resultApi.getAll().then((value) {
      setState(() {
        itemLength = value.result.length;
        resultData = value.result;
        isLoading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    displaySize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (isLoading) {
              Get.offAllNamed('/homePage');
            }
          },
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return FutureBuilder(
                      future: _resultApi.getAll(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData == false) {
                          return CircularProgressIndicator();
                        } else if (snapshot.hasError) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Error: ${snapshot.error}',
                              style: TextStyle(fontSize: 15),
                            ),
                          );
                        } else {
                          return Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                width: 300,
                                height: 300,
                                child: CachedNetworkImage(
                                  placeholder: (context, url) => Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: CircularProgressIndicator(),
                                  ),
                                  imageUrl: resultData[index].path,
                                ),
                              ),
                              Text(resultData[index].id.toString() + "번째 기부자"),
                              Text(resultData[index].name),
                            ],
                          );
                        }
                      },
                    );
                  },
                  itemCount: itemLength == null ? 0 : itemLength,
                  viewportFraction: 0.2,
                  autoplay: false,
                  control: new SwiperControl(
                    iconNext: null,
                    iconPrevious: null,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
