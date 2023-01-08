class BookForYou {
  int? id;
  String? tentruyen;
  String? hinhanh;
  String? tacgia;
  int? chuongmoinhat;
  double? sosao;
  String? theloai;
  String? mota;
  int? luotxem;

  BookForYou(
      {this.id,
      this.tentruyen,
      this.hinhanh,
      this.tacgia,
      this.chuongmoinhat,
      this.sosao,
      this.theloai,
      this.mota,
      this.luotxem});

  BookForYou.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tentruyen = json['tentruyen'];
    hinhanh = json['hinhanh'];
    tacgia = json['tacgia'];
    chuongmoinhat = json['chuongmoinhat'];
    sosao = json['sosao'];
    theloai = json['theloai'];
    mota = json['mota'];
    luotxem = json['luotxem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tentruyen'] = this.tentruyen;
    data['hinhanh'] = this.hinhanh;
    data['tacgia'] = this.tacgia;
    data['chuongmoinhat'] = this.chuongmoinhat;
    data['sosao'] = this.sosao;
    data['theloai'] = this.theloai;
    data['mota'] = this.mota;
    data['luotxem'] = this.luotxem;
    return data;
  }
}
