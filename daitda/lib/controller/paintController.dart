import 'package:get/get.dart';

class PaintController extends GetxController {
  static PaintController get to => Get.find();

  bool paintState;

  void setPaintState(bool state) {
    this.paintState = state;
    update();
  }

  bool getPaintState() {
    return paintState;
  }
}
