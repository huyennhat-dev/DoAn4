class BookLibrary {
  int? id;
  String? tentruyen;
  String? hinhanh;
  String? tacgia;
  String? theloai;
  int? truyenId;
  int? chuongSlug;
  int? tongsochuong;

  BookLibrary(
      {this.id,
      this.tentruyen,
      this.hinhanh,
      this.tacgia,
      this.theloai,
      this.truyenId,
      this.chuongSlug,
      this.tongsochuong});

  BookLibrary.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tentruyen = json['tentruyen'];
    hinhanh = json['hinhanh'];
    tacgia = json['tacgia'];
    theloai = json['theloai'];
    truyenId = json['truyen_id'];
    chuongSlug = json['chuong_slug'];
    tongsochuong = json['tongsochuong'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tentruyen'] = this.tentruyen;
    data['hinhanh'] = this.hinhanh;
    data['tacgia'] = this.tacgia;
    data['theloai'] = this.theloai;
    data['truyen_id'] = this.truyenId;
    data['chuong_slug'] = this.chuongSlug;
    data['tongsochuong'] = this.tongsochuong;
    return data;
  }
}
