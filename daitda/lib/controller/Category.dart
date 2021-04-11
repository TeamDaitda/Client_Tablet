import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Category extends GetxController {
  static Category get to => Get.find();

  final List<CategoryMember> categoryMember = List<CategoryMember>();

  Category() {
    categoryMember.add(CategoryMember(
        id: 0, title: "한부모 가정 / 조손 가정", body: "주제 관련 설명이 들어갈 예정입니다", img: Image.asset('images/main.png')));
    categoryMember.add(
        CategoryMember(id: 1, title: "소년소녀 가정", body: "null", img: Image.asset('images/refugee.png')));
    categoryMember.add(
        CategoryMember(id: 2, title: "중증 장애인", body: "null", img: Image.asset('images/main.png')));
    categoryMember.add(
        CategoryMember(id: 3, title: "상이 군경", body: "null", img: Image.asset('images/hanbumo.png')));
    categoryMember.add(
        CategoryMember(id: 4, title: "독거노인", body: "null", img: Image.asset('images/main.png')));
    categoryMember
        .add(CategoryMember(id: 5, title: "기아", body: "null", img: Image.asset('images/refugee.png')));
    categoryMember
        .add(CategoryMember(id: 6, title: "난민", body: "null", img: Image.asset('images/hanbumo.png')));
    categoryMember
        .add(CategoryMember(id: 7, title: "유기견", body: "null", img: Image.asset('images/main.png')));
    categoryMember.add(
        CategoryMember(id: 8, title: "지구온난화", body: "null", img: Image.asset('images/hanbumo.png')));
  }

  List<CategoryMember> getCategory() {
    return categoryMember;
  }
}

class CategoryMember {
  final int id;
  final String title;
  final String body;
  final Image img;

  CategoryMember({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.img,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };

  }

  @override
  toString() {
    return "Category{id: $id, title: $title, body: $body}";img;
  }

  String getTitle() {
    return title;
  }
  Image getimg(){
    return img;
  }
}
