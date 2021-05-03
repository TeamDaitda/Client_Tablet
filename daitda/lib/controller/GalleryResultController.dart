// To parse this JSON data, do
//
//     final result = resultFromJson(jsonString);

import 'dart:convert';

List<Result> resultFromJson(String str) =>
    List<Result>.from(json.decode(str).map((x) => Result.fromJson(x)));

String resultToJson(List<Result> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

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
