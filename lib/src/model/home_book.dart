class HomeBook {
  int? id;
  String? tentruyen;
  String? hinhanh;
  String? slug;
  String? mota;
  String? tacgia;
  int? chuongmoinhat;

  HomeBook(
      {this.id,
      this.tentruyen,
      this.hinhanh,
      this.slug,
      this.mota,
      this.tacgia,
      this.chuongmoinhat});

  HomeBook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tentruyen = json['tentruyen'];
    hinhanh = json['hinhanh'];
    slug = json['slug'];
    mota = json['mota'];
    tacgia = json['tacgia'];
    chuongmoinhat = json['chuongmoinhat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tentruyen'] = this.tentruyen;
    data['hinhanh'] = this.hinhanh;
    data['slug'] = this.slug;
    data['mota'] = this.mota;
    data['tacgia'] = this.tacgia;
    data['chuongmoinhat'] = this.chuongmoinhat;
    return data;
  }
}
