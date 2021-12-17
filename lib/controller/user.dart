import 'package:daitda/model/outputModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  List<OutPut> point;

  int id;
  int selectedCategoryIndex;
  String name;
  String phone;
  String affiliation;
  bool isAdView;
  bool isShoot;
  bool isFinished;

  int getId() => id;
  int getSelectedCategoryIndex() => selectedCategoryIndex;
  String getName() => name;
  String getPhone() => phone;
  String getAffiliation() => affiliation;
  bool getIsAdView() => isAdView;
  bool getIsShoot() => isShoot;
  bool getIsFinished() => isFinished;

  void setId({@required int id}) {
    this.id = id;
    update();
  }

  void setSelectedCategoryIndex({@required int index}) {
    this.selectedCategoryIndex = index;
    update();
  }

  void setName({@required String name}) {
    this.name = name;
    update();
  }

  void setPhone({@required String phone}) {
    this.phone = phone;
    update();
  }

  void setAffiliation({@required String affiliation}) {
    this.affiliation = affiliation;
    update();
  }

  void setIsAdView({@required bool isAdView}) {
    this.isAdView = isAdView;
    update();
  }

  void setIsShoot({@required bool isShoot}) {
    this.isShoot = isShoot;
    update();
  }

  void setIsFinished({@required bool isFinished}) {
    this.isFinished = isFinished;
    update();
  }

  void reset() {
    this.point = [];
    this.selectedCategoryIndex = -1;
    this.name = "";
    this.phone = "";
    this.affiliation = "";
    this.isAdView = false;
    this.isShoot = false;
    this.isFinished = false;
    update();
  }
}
