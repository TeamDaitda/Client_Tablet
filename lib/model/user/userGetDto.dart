import 'dart:convert';

UserGetDto userGetDtoFromJson(String str) =>
    UserGetDto.fromJson(json.decode(str));

String userGetDtoToJson(UserGetDto data) => json.encode(data.toJson());

class UserGetDto {
  UserGetDto({
    this.id,
    this.name,
    this.affiliation,
    this.phone,
    this.category,
  });

  int id;
  String name;
  String affiliation;
  String phone;
  int category;

  factory UserGetDto.fromJson(Map<String, dynamic> json) => UserGetDto(
        id: json["id"],
        name: json["name"],
        affiliation: json["affiliation"],
        phone: json["phone"],
        category: json["category"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "affiliation": affiliation,
        "phone": phone,
        "category": category,
      };
}
