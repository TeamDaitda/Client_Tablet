import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class PrintApi {
  final Dio dio = new Dio();

  // 이미지 저장 정보 저장
  Future<int> save({@required String path, @required int id}) async {
    Response response = await dio.post(
        "http://15.164.195.117:8080/backend-0.0.1-SNAPSHOT/api/print",
        data: {
          "userId": id,
          "path": path,
        });
    return response.data;
  }
}
