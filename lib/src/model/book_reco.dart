class BookRecommendation {
  int? id;
  String? tentruyen;
  String? hinhanh;
  String? tacgia;
  int? chuongmoinhat;
  String? theloai;
  String? tinhcach;
  String? luuphai;
  String? thegioi;

  BookRecommendation(
      {this.id,
      this.tentruyen,
      this.hinhanh,
      this.tacgia,
      this.chuongmoinhat,
      this.theloai,
      this.tinhcach,
      this.luuphai,
      this.thegioi});

  BookRecommendation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tentruyen = json['tentruyen'];
    hinhanh = json['hinhanh'];
    tacgia = json['tacgia'];
    chuongmoinhat = json['chuongmoinhat'];
    theloai = json['theloai'];
    tinhcach = json['tinhcach'];
    luuphai = json['luuphai'];
    thegioi = json['thegioi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tentruyen'] = this.tentruyen;
    data['hinhanh'] = this.hinhanh;
    data['tacgia'] = this.tacgia;
    data['chuongmoinhat'] = this.chuongmoinhat;
    data['theloai'] = this.theloai;
    data['tinhcach'] = this.tinhcach;
    data['luuphai'] = this.luuphai;
    data['thegioi'] = this.thegioi;
    return data;
  }
}
