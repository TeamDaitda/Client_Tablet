import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Category extends GetxController {
  static Category get to => Get.find();

  final List<CategoryMember> categoryMember = List<CategoryMember>();

  Category() {
    categoryMember.add(CategoryMember(
        id: 0, title: "한부모 가정 / 조손 가정", subtitle: "subtitle", body: "만 18살 이하 자녀를 홀로 양육하고 있는 한 부모의 상당수는 일을 하고 있음에도\n소득이 충분하지 않은 근로빈곤층에 속해 있을 가능성이 높습니다. \n\n한부모 가구주 2500명 중 취업상태인 한부모들은 84.2%로 대다수가 현재 경제활동을 하고 있습니다.\n하지만 절반 이상이 한달 소득 200만원 미만이었으며 10명 중 1명은 100만원도 되지 않습니다. \n이는 전체 가구 평균 소득인 389만원의 절반을 겨우 넘는 수준입니다.\n\n한부모들과 아이들이 최소한의 안전망 속에서 살아갈 수 있도록 \n 당신의 시간을 나누어주세요", img: Image.asset('images/singleparent.png')));
    categoryMember.add(
        CategoryMember(id: 1, title: "소년소녀 가정", subtitle: "subtitle", body: "null", img: Image.asset('images/household.png')));
    categoryMember.add(
        CategoryMember(id: 2, title: "중증 장애인", subtitle: "subtitle", body: "null", img: Image.asset('images/disabled.png')));
    categoryMember.add(
        CategoryMember(id: 3, title: "상이 군경", subtitle: "subtitle", body: "null", img: Image.asset('images/soldier.png')));
    categoryMember.add(
        CategoryMember(id: 4, title: "독거노인", subtitle: "subtitle", body: "null", img: Image.asset('images/elders.png')));
    categoryMember.add(
      CategoryMember(id: 5, title: "기아", subtitle: "subtitle", body: "null", img: Image.asset('images/refugee.png')));
    categoryMember.add(
      CategoryMember(id: 6, title: "난민", subtitle: "subtitle", body: "null", img: Image.asset('images/refugee.png')));
    categoryMember.add(
      CategoryMember(id: 7, title: "유기견", subtitle: "subtitle", body: "null", img: Image.asset('images/abandoneddog.png')));
    categoryMember.add(
        CategoryMember(id: 8, title: "지구온난화", subtitle: "subtitle",body: "null", img: Image.asset('images/globalWarming.png')));
  }

  List<CategoryMember> getCategory() {
    return categoryMember;
  }
}

class CategoryMember {
  final int id;
  final String title;
  final String body;
  final String subtitle;
  final Image img;

  CategoryMember({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.subtitle,
    @required this.img,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
      'subtitle': subtitle,

    };

  }

  @override
  toString() {
    return "Category{id: $id, title: $title, subtitle: $subtitle, body: $body}";
  }

  String getTitle() {
    return title;
  }

  String getBody(){
    return body;
  }
  
  String getsubTitle() {
    return subtitle;
  }



  Image getimg(){
    return img;
  }
}
