import 'dart:math';

import 'package:daitda/model/outputModel.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class ImageTransApi {
  Future<FormData> FormDataImage(
      {@required String filePath, @required String fileName}) async {
    return FormData.fromMap({
      "image": await MultipartFile.fromFile(filePath, filename: fileName),
    });
  }

  Future<List<OutPut>> transImage(
      {@required String filePath, @required String fileName}) async {
    double minX = 999999;
    double minY = 999999;

    print("image service -----");
    print("print path + name :" + filePath + fileName);
    try {
      Response response = await Dio().post(
          "http://58.123.40.137:3000/api/image/imageUploadAndTranslateToJson",
          data: await FormDataImage(filePath: filePath, fileName: fileName),
          onSendProgress: (received, total) {
        if (total != -1) {
          print((received / total * 100).toStringAsFixed(0) + "%");
        }
      });

      var objJson = jsonDecode(response.toString())['output'] as List;
      List<OutPut> outputObjs = objJson.map((_) => OutPut.fromJson(_)).toList();
      var length = outputObjs.length;
      for (int i = 0; i < length; i++) {
        if (outputObjs[i].dX < minX) {
          minX = outputObjs[i].dX;
        }
        if (outputObjs[i].dY < minY) {
          minY = outputObjs[i].dY;
        }
      }
      for (int i = 0; i < length; i++) {
        outputObjs[i].dX -= minX + Random().nextInt(50) - 200;
        outputObjs[i].dY -= minY + Random().nextInt(50) - 100;
      }
      return outputObjs;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
