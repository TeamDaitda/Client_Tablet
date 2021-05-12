// To parse this JSON data, do
//
//     final resultGetAllDto = resultGetAllDtoFromJson(jsonString);

import 'dart:convert';

ResultGetAllDto resultGetAllDtoFromJson(String str) =>
    ResultGetAllDto.fromJson(json.decode(str));

String resultGetAllDtoToJson(ResultGetAllDto data) =>
    json.encode(data.toJson());

class ResultGetAllDto {
  ResultGetAllDto({
    this.result,
  });

  List<Result> result;

  factory ResultGetAllDto.fromJson(Map<String, dynamic> json) =>
      ResultGetAllDto(
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
    this.userId,
    this.name,
    this.phone,
    this.category,
    this.path,
  });

  int id;
  int userId;
  String name;
  String phone;
  int category;
  String path;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        userId: json["userId"],
        name: json["name"],
        phone: json["phone"],
        category: json["category"],
        path: json["path"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "name": name,
        "phone": phone,
        "category": category,
        "path": path,
      };
}
