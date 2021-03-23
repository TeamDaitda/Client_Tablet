import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Category extends GetxController {
  static Category get to => Get.find();

  final List<CategoryMember> categoryMember = List<CategoryMember>();

  Category() {
    categoryMember.add(CategoryMember(
        id: 0, title: "한부모 가정 / 조손 가정", body: "null", imgUrl: "null"));
    categoryMember.add(
        CategoryMember(id: 1, title: "소년소녀 가정", body: "null", imgUrl: "null"));
    categoryMember.add(
        CategoryMember(id: 2, title: "중증 장애인", body: "null", imgUrl: "null"));
    categoryMember.add(
        CategoryMember(id: 3, title: "상이 군경", body: "null", imgUrl: "null"));
    categoryMember.add(
        CategoryMember(id: 4, title: "독거노인", body: "null", imgUrl: "null"));
    categoryMember
        .add(CategoryMember(id: 5, title: "기아", body: "null", imgUrl: "null"));
    categoryMember
        .add(CategoryMember(id: 6, title: "난민", body: "null", imgUrl: "null"));
    categoryMember
        .add(CategoryMember(id: 7, title: "유기견", body: "null", imgUrl: "null"));
    categoryMember.add(
        CategoryMember(id: 8, title: "지구온난화", body: "null", imgUrl: "null"));
  }

  List<CategoryMember> getCategory() {
    return categoryMember;
  }
}

class CategoryMember {
  final int id;
  final String title;
  final String body;
  final String imgUrl;

  CategoryMember({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.imgUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'imgUrl': imgUrl,
    };
  }

  @override
  String toString() {
    return "Category{id: $id, title: $title, body: $body, imgUrl: $imgUrl}";
  }
}
