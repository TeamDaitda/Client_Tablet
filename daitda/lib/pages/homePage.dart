import 'package:daitda/pages/categoryPage.dart';
import 'package:daitda/pages/galleryPage.dart';
import 'package:daitda/service/adApi.dart';
import 'package:daitda/service/imageApi.dart';
import 'package:daitda/service/userService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // http test
  UserApi userApi = new UserApi();
  ImageApi imageApi = new ImageApi();
  AdApi adApi = new AdApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2C2F33),
      body: Stack(
        children: <Widget>[
          Center(
            child: Opacity(
              child: SvgPicture.asset(
                'images/sym.svg',
                width: 830,
                height: 830,
              ),
              opacity: 0.05,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 100),
            child: Center(
                child: SvgPicture.asset(
              'images/text.svg',
              width: 110,
              height: 110,
            )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 420, 0, 0),
            child: Center(
              child: Column(
                children: [
                  OutlinedButton(
                    onPressed: () async {
                      // userApi
                      //     .save(
                      //         affiliation: "소속입니다",
                      //         category: 1234,
                      //         name: "이름입니다",
                      //         phone: "휴대폰입니다")
                      //     .then((value) => print(value));
                      //
                      //
                      // userApi
                      //     .update(id: 20, categoryId: 10)
                      //     .then((value) => print(value));
                      //
                      //
                      // userApi.get(id: 3).then((value) {
                      //   print(value.id);
                      //   print(value.name);
                      //   print(value.category);
                      //   print(value.affiliation);
                      //   print(value.phone);
                      // });
                      //
                      // userApi.getAll().then((value) {
                      //   value.result.forEach((element) {
                      //     print(element.id);
                      //     print(element.name);
                      //     print(element.category);
                      //     print(element.affiliation);
                      //     print(element.phone);
                      //   });
                      // });
                      //
                      // imageApi.imageFindByUserIdDto(id: 1).then((value) {
                      //   print(value.id);
                      //   print(value.path);
                      //   print(value.users.id);
                      //   print(value.users.category);
                      //   print(value.users.affiliation);
                      //   print(value.users.createDate);
                      //   print(value.users.modifiedDate);
                      //   print(value.users.name);
                      //   print(value.users.phone);
                      // });
                      //
                      adApi.update(id: 1).then((value) => print(value));
                    },
                    child: Text("테스트"),
                  ),
                  Text(
                    'Draw your line,',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    'Makes our life,',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/galleryPage');
                        },
                        child: Text(
                          '갤러리',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 14.0,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed('/categoryPage');
                        },
                        child: Text(
                          '시작하기',
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
