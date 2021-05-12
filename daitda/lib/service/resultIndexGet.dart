import 'dart:convert';
import 'package:daitda/controller/GalleryResultController.dart';
import 'package:dio/dio.dart';

class GetResultIndex {
  String url;
  Response<String> response;
  Dio dio = new Dio();

  GetResultIndex();

  // Future<List<Result>> getResultIndex() async  {
  //   var jsonToData;
  //   url = "http://192.168.35.35:8080/result";
  //   response = await dio.get(url);

  //   jsonToData = jsonDecode(response.data);
  //   // return resultFromJson();
  // }
}
