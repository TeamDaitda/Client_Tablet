import 'package:daitda/model/result/resultGetAllDto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ResultApi {
  final Dio dio = new Dio();
  // 사용자 아이디로 결과 등록
  Future<int> save({@required int id}) async {
    Response response;
    try {
      response = await dio.post(
        "http://15.164.195.117:8080/backend-0.0.1-SNAPSHOT/api/result/$id",
      );
    } catch (e) {
      print("ERROR" + e.toString());
      return -1;
    }
    return response.data;
  }

  // 모든 기부 결과 리스트 출력
  Future<ResultGetAllDto> getAll() async {
    Response response;

    try {
      response = await dio
          .get("http://15.164.195.117:8080/backend-0.0.1-SNAPSHOT/api/result");
      ResultGetAllDto resultGetAllDto =
          new ResultGetAllDto.fromJson(response.data);
      return resultGetAllDto;
    } catch (e) {
      return new ResultGetAllDto(result: []);
    }
  }
}
