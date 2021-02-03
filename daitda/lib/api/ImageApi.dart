import 'package:daitda/Util/image.dart';
import 'package:dio/dio.dart';

class ImageApi {
  void getHttp(String url) async {
    try {
      Response response = await Dio().get("$url");
      print(response);
    } catch (e) {
      print(e);
    }
  }

  void transImage() async {
    try {
      Response response = await Dio()
          .get("http://192.168.35.252:3000/api/image/translateImage");
      print(response);

      // List<Positions> position = Positions.fromJson(response.data);

      // List<Positions.fromJson(response.data)>;

      // print(transImage);
    } catch (e) {
      print(e);
    }
  }
}
