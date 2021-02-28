class Category {
  List<CategoryMember> categoryMember;

  Category() {
    categoryMember
        .add(CategoryMember(id: 0, title: "한부모 가정 / 조손 가정", body: ""));
    categoryMember.add(CategoryMember(id: 1, title: "소년소녀 가정", body: ""));
    categoryMember.add(CategoryMember(id: 2, title: "중증 장애인", body: ""));
    categoryMember.add(CategoryMember(id: 3, title: "상이 군경", body: ""));
    categoryMember.add(CategoryMember(id: 4, title: "독거노인", body: ""));
    categoryMember.add(CategoryMember(id: 5, title: "기아", body: ""));
    categoryMember.add(CategoryMember(id: 6, title: "난민", body: ""));
    categoryMember.add(CategoryMember(id: 7, title: "유기견", body: ""));
    categoryMember.add(CategoryMember(id: 8, title: "지구온난화", body: ""));
  }

  List<CategoryMember> getCategory() {
    return categoryMember;
  }
}

class CategoryMember {
  final int id;
  final String title;
  final String body;

  CategoryMember({
    this.id,
    this.title,
    this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  @override
  String toString() {
    return "Category{id: $id, title: $title, body: $body}";
  }
}
