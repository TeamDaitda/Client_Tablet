import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AdApi {
  final Dio _dio = new Dio();

  // 광고 조회수 처리
  Future<int> update({@required int id}) async {
    Response response = await _dio.patch(
        "http://15.164.195.117:8080/backend-0.0.1-SNAPSHOT/api/ad/view",
        data: {
          "adId": 2,
          "userId": id,
        });
    return response.data;
  }
}
