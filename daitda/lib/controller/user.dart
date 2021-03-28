
import 'package:daitda/model/outputModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get to => Get.find();

  List<OutPut> point;

  int selectedCategoryIndex;
  String name;
  String phone;
  String affiliation;
  bool isAdView;
  bool isShoot;
  bool isFinished;

  int getSelectedCategoryIndex() => selectedCategoryIndex;
  String getName() => name;
  String getPhone() => phone;
  String getAffiliation() => affiliation;
  bool getIsAdView() => isAdView;
  bool getIsShoot() => isShoot;
  bool getIsFinished() => isFinished;

  void setSelectedCategoryIndex({@required int index}) {
    this.selectedCategoryIndex = index;
  }

  void setName({@required String name}) {
    this.name = name;
  }

  void setPhone({@required String phone}) {
    this.phone = phone;
  }

  void setAffiliation({@required String affiliation}) {
    this.affiliation = affiliation;
  }

  void setIsAdView({@required bool isAdView}) {
    this.isAdView = isAdView;
  }

  void setIsShoot({@required bool isShoot}) {
    this.isShoot = isShoot;
  }

  void setIsFinished({@required bool isFinished}) {
    this.isFinished = isFinished;
  }
}
