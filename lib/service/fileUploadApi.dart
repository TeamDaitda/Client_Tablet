import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';

class FileUploadApi {
  final Dio dio = new Dio();

  // 이미지를 파일로
  Future<File> imageToFile({@required Uint8List data}) async {
    String tempPath = (await getTemporaryDirectory()).path;
    File file = await File("$tempPath/image.png").writeAsBytes(data);
    // await file.writeAsBytes(data);
    return file;
  }

// 파일 업로드
  Future<String> upload({@required Uint8List data}) async {
    String tempPath = (await getTemporaryDirectory()).path;
    File file = await File("$tempPath/image.jpg").writeAsBytes(data);

    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path),
    });
    Response response = await dio.post(
        "http://15.164.195.117:8080/backend-0.0.1-SNAPSHOT/api/upload",
        data: formData);

    return response.data;
  }
}
