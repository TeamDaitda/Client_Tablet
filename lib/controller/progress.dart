import 'package:get/get.dart';

class ProgressData extends GetxController {
  double data;

  void setData(double n) {
    data = n;
    update();
  }

  double getData() {
    return data;
  }
}
