import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _urls = [
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30su01mhov1q4ici81bvlqqaa.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t1pegdm64sq1g4o1aoohaca.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t911f12ml1giicqldi51ue5a.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30thubh1ejm682115v2kl1jcga.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30tfki11ljgcbpk641b5j634a.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30su01mhov1q4ici81bvlqqaa.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t1pegdm64sq1g4o1aoohaca.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t911f12ml1giicqldi51ue5a.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30thubh1ejm682115v2kl1jcga.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30tfki11ljgcbpk641b5j634a.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30su01mhov1q4ici81bvlqqaa.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t1pegdm64sq1g4o1aoohaca.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t911f12ml1giicqldi51ue5a.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30thubh1ejm682115v2kl1jcga.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30tfki11ljgcbpk641b5j634a.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30su01mhov1q4ici81bvlqqaa.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t1pegdm64sq1g4o1aoohaca.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t911f12ml1giicqldi51ue5a.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30thubh1ejm682115v2kl1jcga.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30tfki11ljgcbpk641b5j634a.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30su01mhov1q4ici81bvlqqaa.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t1pegdm64sq1g4o1aoohaca.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t911f12ml1giicqldi51ue5a.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30thubh1ejm682115v2kl1jcga.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30tfki11ljgcbpk641b5j634a.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30su01mhov1q4ici81bvlqqaa.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t1pegdm64sq1g4o1aoohaca.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t911f12ml1giicqldi51ue5a.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30thubh1ejm682115v2kl1jcga.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30tfki11ljgcbpk641b5j634a.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30su01mhov1q4ici81bvlqqaa.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t1pegdm64sq1g4o1aoohaca.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t911f12ml1giicqldi51ue5a.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30thubh1ejm682115v2kl1jcga.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30tfki11ljgcbpk641b5j634a.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30su01mhov1q4ici81bvlqqaa.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t1pegdm64sq1g4o1aoohaca.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30t911f12ml1giicqldi51ue5a.jpg',
    'http://www.artya.co.kr/niabbs5/upload/userfile/o_1d30thubh1ejm682115v2kl1jcga.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.pink,
        label: Text("시작하기"),
        onPressed: () {
          Navigator.pushNamed(context, '/categoryPage');
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: _urls.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 0),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Image.network(
                    _urls[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ),
          // Text("dd")
        ],
      ),
    );
  }
}
