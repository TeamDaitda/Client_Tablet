import 'dart:typed_data';

class ArgumentsData {
  int id;
  String name;
  String phone;
  String affiliation;
  int category;
  Uint8List data;

  ArgumentsData(
      int id, String name, String phone, String affiliation, int category,
      {Uint8List data}) {
    if (data != null) this.data = data;
    this.id = id;
    this.name = name;
    this.phone = phone;
    this.affiliation = affiliation;
    this.category = category;
  }
}
