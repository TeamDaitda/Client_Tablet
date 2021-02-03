import 'package:daitda/Util/image.dart';
import 'package:daitda/controller/user.dart';
import 'package:dio/dio.dart';
// import 'package:get/get.dart';
import 'dart:convert';

class ImageApi {
  void getHttp(String url) async {
    try {
      Response response = await Dio().get("$url");
      print(response);
    } catch (e) {
      print(e);
    }
  }

  Future transImage() async {
    try {
      Response response = await Dio()
          .get("http://192.168.35.252:3000/api/image/translateImage");
      // print(response);

      var objJson = jsonDecode(response.toString())['output'] as List;
      List<OutPut> outputObjs = objJson.map((_) => OutPut.fromJson(_)).toList();
      var length = outputObjs.length;
      for (int i = 0; i < length; i++) {
        print("${outputObjs[i].dX}:${outputObjs[i].dY} ");
      }
      return outputObjs;
    } catch (e) {
      print(e);
    }
  }
}
