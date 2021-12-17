class OutPut {
  double dX;
  double dY;

  OutPut(this.dX, this.dY);

  factory OutPut.fromJson(dynamic json) {
    return OutPut(json['_x'] as double, json['_y'] as double);
  }

  String toString() {
    return '{${this.dX}, ${this.dY}}';
  }
}