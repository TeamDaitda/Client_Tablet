import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Category extends GetxController {
  static Category get to => Get.find();

  final List<CategoryMember> categoryMember = List<CategoryMember>();

  Category() {
    categoryMember.add(CategoryMember(
        id: 0, title: "한부모 가정 / 조손 가정", subtitle: "한부모와 아이들이 보살핌 속에 살아갈 수 있도록,", body: '"아파도 병원에 갈 수가 없어요. 제가 쉬면 경제적 부담은 물론, 집안일을 맡길 곳이 없어요."\n\n경제활동중인 한부모 중 절반 이상이 한달에 200만원도 채 벌지 못하고 있으며\n10명 중 1명은 한달 소득이 100만원이 되지 않습니다.\n이는 전체 가구의 평균인 389만원의 절반을 겨우 넘는 수준입니다.\n\n또한 경제적 문제를 넘어, 코로나 팬데믹에 학교를 가지 못하는\n아이들에게 부모님의 빈자리는 더욱 크게 느껴집니다.\n\n한부모와 아이들이 최소한의 보살핌 속에서 살아갈 수 있도록\n당신의 시간을 나누어주세요.', img: Image.asset('images/singleparent.png')));
    categoryMember.add(
        CategoryMember(id: 1, title: "소년소녀 가정", subtitle: "아이들에게 든든한 울타리를 지어줄 수 있도록,", body: '"전국 소년소녀 가정 수는 17명, 보건복지부의 통계에 따르면\n2019년 전국 소년소녀 가정은 17명에 불과합니다."\n\n이는 많은 소년소녀 가정이 가정위탁 아동으로 변하고 있기 때문입니다.\n2019년 소년소녀 가정에서 전환된 가정위탁 보호아동은 389명에 달합니다.\n\n그러나 가정위탁을 위한 부모들의 숫자는 매번 부족하기만 합니다.\n친부모의 학대,사망등으로 안전한 울타리를 잃은 아이들이 \n안락한 가정에서 자라날 수 있도록 많은 관심이 필요합니다.\n\n아이들에게 든든한 울타리를 지어줄 수 있도록\n당신의 시간을 나누어주세요.', img: Image.asset('images/household.png')));
    categoryMember.add(
        CategoryMember(id: 2, title: "장애인", subtitle: "다르지 않게 살아갈 수 있도록,", body: '"장애를 선천적으로 가지고 태어난 경우는 6%뿐이에요. 더이상 남의 이야기가 아니죠."\n\n2020년도 우리나라에 등록된 장애인의 수는 260만명입니다.\n이중 질환으로 인한 장애가 56%, 사고로 인한 장애가 32%로\n10명 중 9명이 사고와 질환으로 후천적 장애를 가지게 된 셈입니다.\n\n더이상 장애는 남의 이야기가 아닙니다.\n하지만 장애인들이 받는 편견과 고통은 나아지지 않고 있습니다.\n\n선천적이든 후천적이든 그들이 우리와 틀리지 않음을 모두가 알고 있습니다.\n이제는 다르지 않게 살아갈 수 있도록 당신의 시간을 나누어주세요.', img: Image.asset('images/disabled.png')));
    categoryMember.add(
        CategoryMember(id: 3, title: "상이 군경", subtitle: "앞으로도 자랑스럽게 살아갈 수 있도록,", body: '"놀랍고 무섭고 그냥 빨리 병원을 나가고 싶단 생각밖에 없었어요."\n\n군 북모 중 왼쪽 눈을 실명한 G씨, 허리에 철심을 박은 K씨, 왼쪽 귀의 청력을 잃은 C씨.\n이들은 신성한 국방의 의무 중 겪은 사고로 인해 평생 큰 집을 안고 살아가야 합니다.\n그러나 국가유공자 혹은 보훈보상대상자로 조차 인정받지 못했습니다.\n\n또한 인정을 받는다고 해도 그들에 대한 관심과 보상은 냉랭하기만 합니다.\n두 눈이 실명되고 언어와 청각기능을 모두 잃는 수준의 가장 높은 등급을 받은\n 상이 군경의 보상금 조차 316만원으로 젊음의 대가는 처참합니다.\n\n국가의 부름을 받아 신성한 의무를 이행했던 이들이\n 앞으로도 자랑스럽게 살아갈 수 있도록 당신의 시간을 나누어주세요.', img: Image.asset('images/soldier.png')));
    categoryMember.add(
        CategoryMember(id: 4, title: "독거노인", subtitle: "subtitle", body: '"하루에 몇 마디나 하겠어요. 걸려 오는 전화로 살아있음을 느껴요."\n\n코로나 바이러스의 차가운 바람은 독거노인들에게 더욱 크게 다가옵니다.\n지역 경로당은 물론, 무료 급식소마저 운영을 중단하는 곳이 늘어나고 있습니다.\n자원 봉사자의 수도 2020년 기준 작년대비 53% 감소한 상황입니다.\n\n이러한 만남의 단절은 독거노인들의 쓸쓸한 죽음으로 이어집니다\n2020년 한 해 고독하게 세상을 떠나신 분들의 수는 388명입니다.\n\n158만 9371명.\n이들이 잊혀지지 않고 살아갈 수 있도록 당신의 시간을 나누어주세요.', img: Image.asset('images/elders.png')));
    categoryMember.add(
      CategoryMember(id: 5, title: "기아 난민", subtitle: "생사의 갈림길에서 고통스러워 하지 않도록,", body: '"풍요의 시대에 무대응과 무관심으로 일관한다면 우리에게는 변명의 여지가 없다."\n\n계속되는 기후변화와 코로나 팬데믹의 영향으로 세계 기아 인구는 유래없는 상승세를 맞았습니다.\n2020s년 단 한해동안 1억 3천만명이 증가해 세계 기아수는 총 8억 1천만 명에 달했습니다.\n\n심각한 가뭄에서 시작된 식량난은 더 심한 분쟁으로 이어지고,\n이러한 분쟁 속에선 농사를 지을 수 없어 식량난이 심해지는\n끊을 수 없는 고리. 이들에게 피난은 유일한 선택지입니다.\n\n이들이 인간답게, 사람으로 살아갈 수 있도록\n생사의 갈림길에서 고통스러워하지 않도록\n당신의 시간을 나누어주세요.', img: Image.asset('images/refugee.png')));
    
    categoryMember.add(
      CategoryMember(id: 6, title: "유기동물", subtitle: "더 큰 아픔을 겪지 않도록,", body: '"13만 5천 791마리 중 다시 주인을 찾는 친구는 4만 마리에 불과해요."\n\n2019년 우리나라에서 발생한 유기/유실 동물 수는 총 13만 5천 791마리입니다.\n전년 대비 12%나 증가한 수치로, 매일 372마리가 주인에게 버려지고 있는 상황입니다.\n\n이중에서 다시 주인에게 돌아가거나, 새 주인을 찾게된 4만 마리를 제외한\n9만 5천 마리는 주인을 그리워하며 눈을 감을 수 밖에 없었습니다.\n\n누구보다 믿고 따랐던 주인에게 버림받은 친구들이\n더 큰 아픔을 겪지 않도록 당신의 시간을 나누어주세요.', img: Image.asset('images/abandoneddog.png')));
   
    categoryMember.add(
        CategoryMember(id: 7, title: "지구온난화", subtitle: "subtitle",body: '"어른들은 아이들을 사랑한다 하지만, 아이들의 미래를 앗아가고 있어요."\n\n지난 11월 지구는 관측 역사상 가장 높은 평균 기온을 기록했습니다.\n녹아내리는 빙하, 북금곰의 개체수..이는 더이상 신선한 충격으로 다가오지 않습니다.\nWHO는 2050년 기후변화와 관련된 스트레스로 매년 25만 명이 목숨을 잃을 것이라 예상합니다.\n\n이제 기후변화는 자연재해를 야기하는 것으로만 끝나지 않습니다.\n기후변화는 심각한 인권 문제로 이어져 북금곰의 터전 뿐 아니라\n우리 인류의 기존 불평등을 확대하고 악화시키는 데에 일조합니다.\n\n인류가 집이라고 부르는 이 지구, 우리 모두가 안전하게 살 수 있는\n공간이 되도록 당신의 시간을 나누어 주세요.', img: Image.asset('images/globalWarming.png')));
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
