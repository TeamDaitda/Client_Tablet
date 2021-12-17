import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:daitda/controller/GalleryResultController.dart';

class ShowCase extends StatefulWidget {
  @override
  _ShowCaseState createState() => _ShowCaseState();
}

class _ShowCaseState extends State<ShowCase> {
  Size displaySize;

  List<Result> itemList;
  int itemListLength;

  @override
  void initState() {
    itemListLength = 0;
    super.initState();
  }

  // void loadResultIndex() {
  //   GetResultIndex().resultIndex.then((value) {
  //     setState(() {
  //       itemList = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    displaySize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      width: displaySize.width,
      height: displaySize.height * 0.6,
      
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
            color: Colors.black,
              border: Border.all(color: Colors.white)
            ),
    
          );
        },

        viewportFraction: 0.5,
        autoplay: true,
        itemCount: 3,
        control: new SwiperControl(
          iconNext: null,
          iconPrevious: null,
        ),
      ),
    );
  }
}
