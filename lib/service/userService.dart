import 'package:daitda/model/user/userGetAllDto.dart';
import 'package:daitda/model/user/userGetDto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class UserApi {
  final Dio dio = new Dio();

  // 사용자 등록
  Future<int> save(
      {@required String affiliation,
      @required int category,
      @required String name,
      @required String phone}) async {
    Response response;
    try {
      response = await dio.post(
          "http://15.164.195.117:8080/backend-0.0.1-SNAPSHOT/api/user",
          data: {
            "affiliation": affiliation,
            "category": category,
            "name": name,
            "phone": phone,
          });
    } catch (e) {
      print("ERROR" + e.toString());
      return -1;
    }
    return response.data;
  }

  // 사용자 기부 카테고리 변경
  Future<int> update({@required int id, @required int categoryId}) async {
    Response response;
    try {
      response = await dio.patch(
        "http://15.164.195.117:8080/backend-0.0.1-SNAPSHOT/api/user/$id",
        data: {
          "category": categoryId,
        },
      );
    } catch (e) {
      print("ERROR" + e.toString());
      return -1;
    }
    return response.data;
  }

  // 사용자 아이디로 사용자 정보 찾기
  Future<UserGetDto> get({@required id}) async {
    Response response;
    UserGetDto userGetDto = new UserGetDto();

    try {
      response = await dio.get(
          "http://15.164.195.117:8080/backend-0.0.1-SNAPSHOT/api/user/$id");
      userGetDto = UserGetDto.fromJson(response.data);
    } catch (e) {
      print("ERROR" + e.toString());
      return new UserGetDto(
          id: 0, name: "", affiliation: "", phone: "", category: 0);
    }
    return userGetDto;
  }

  // 모든 사용자 정보 리스트 출력
  Future<UserGetAllDto> getAll() async {
    Response response;

    try {
      response = await dio
          .get("http://15.164.195.117:8080/backend-0.0.1-SNAPSHOT/api/user/");
      UserGetAllDto userGetAllDto = new UserGetAllDto.fromJson(response.data);
      return userGetAllDto;
    } catch (e) {
      return new UserGetAllDto(result: []);
    }
  }
}
