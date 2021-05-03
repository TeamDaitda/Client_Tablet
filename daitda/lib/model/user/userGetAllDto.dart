import 'dart:convert';

UserGetAllDto userGetAllDtoFromJson(String str) =>
    UserGetAllDto.fromJson(json.decode(str));

String userGetAllDtoToJson(UserGetAllDto data) => json.encode(data.toJson());

class UserGetAllDto {
  UserGetAllDto({
    this.result,
  });

  List<Result> result;

  factory UserGetAllDto.fromJson(Map<String, dynamic> json) => UserGetAllDto(
        result:
            List<Result>.from(json["result"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "result": List<dynamic>.from(result.map((x) => x.toJson())),
      };
}

class Result {
  Result({
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
