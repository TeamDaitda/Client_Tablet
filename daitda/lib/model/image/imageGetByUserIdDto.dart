import 'dart:convert';

ImageFindByUserIdDto imageFindByUserIdDtoFromJson(String str) =>
    ImageFindByUserIdDto.fromJson(json.decode(str));

String imageFindByUserIdDtoToJson(ImageFindByUserIdDto data) =>
    json.encode(data.toJson());

class ImageFindByUserIdDto {
  ImageFindByUserIdDto({
    this.id,
    this.path,
    this.users,
  });

  int id;
  String path;
  Users users;

  factory ImageFindByUserIdDto.fromJson(Map<String, dynamic> json) =>
      ImageFindByUserIdDto(
        id: json["id"],
        path: json["path"],
        users: Users.fromJson(json["users"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "users": users.toJson(),
      };
}

class Users {
  Users({
    this.createDate,
    this.modifiedDate,
    this.id,
    this.name,
    this.affiliation,
    this.phone,
    this.category,
  });

  dynamic createDate;
  dynamic modifiedDate;
  int id;
  String name;
  String affiliation;
  String phone;
  int category;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        createDate: json["createDate"],
        modifiedDate: json["modifiedDate"],
        id: json["id"],
        name: json["name"],
        affiliation: json["affiliation"],
        phone: json["phone"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "createDate": createDate,
        "modifiedDate": modifiedDate,
        "id": id,
        "name": name,
        "affiliation": affiliation,
        "phone": phone,
        "category": category,
      };
}
