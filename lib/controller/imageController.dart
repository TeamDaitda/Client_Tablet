import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  static ImageController get to => Get.find();

  XFile file;

  void setFile({@required XFile file}) {
    this.file = file;
    update();
  }

  XFile getFile() {
    return file != null ? this.file : null;
  }
}