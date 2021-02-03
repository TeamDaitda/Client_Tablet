import 'package:dio/dio.dart';

class Http {
  Map<String, Map<String, double>> map;
  
  void getHttp(String url) async {
    try {
      Response response = await Dio().get("$url");
      print(response);
    } catch (e) {
      print(e);
    }
  }
}
