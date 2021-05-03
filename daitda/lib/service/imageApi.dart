import 'package:daitda/model/image/imageGetByUserIdDto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ImageApi {
  final Dio dio = new Dio();

  // 이미지 저장 정보 저장
  Future<int> save({@required String path, @required int id}) async {
    Response response = await dio.post(
        "http://15.164.195.117:8080/backend-0.0.1-SNAPSHOT/api/image",
        data: {
          "path": path,
          "userId": id,
        });
    return response.data;
  }

  // 사용자 아이디로 이미지 정보 찾기
  Future<ImageFindByUserIdDto> imageFindByUserIdDto({@required int id}) async {
    Response response = await dio.get(
        "http://15.164.195.117:8080/backend-0.0.1-SNAPSHOT/api/image/userId/$id");
    ImageFindByUserIdDto imageFindByUserIdDto =
        new ImageFindByUserIdDto.fromJson(response.data);
    return imageFindByUserIdDto;
  }
}
