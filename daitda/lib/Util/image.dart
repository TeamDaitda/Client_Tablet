class Positions {
  double dX;
  double dY;

  Positions({this.dX, this.dY});

  Positions.fromJson(Map<String, dynamic> json) {
    dX = json['_x'];
    dY = json['_y'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_x'] = this.dX;
    data['_y'] = this.dY;
    return data;
  }
}
