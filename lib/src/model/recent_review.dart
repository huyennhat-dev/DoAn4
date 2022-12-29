class RecentReview {
  int? id;
  String? uphoto;
  String? username;
  int? truyenid;
  String? tentruyen;
  String? hinhanh;
  String? tacgia;
  double? sosao;
  String? noidung;
  String? ngaydang;

  RecentReview(
      {this.id,
      this.uphoto,
      this.username,
      this.truyenid,
      this.tentruyen,
      this.hinhanh,
      this.tacgia,
      this.sosao,
      this.noidung,
      this.ngaydang});

  RecentReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uphoto = json['uphoto'];
    username = json['username'];
    truyenid = json['truyenid'];
    tentruyen = json['tentruyen'];
    hinhanh = json['hinhanh'];
    tacgia = json['tacgia'];
    sosao = json['sosao'];
    noidung = json['noidung'];
    ngaydang = json['ngaydang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uphoto'] = this.uphoto;
    data['username'] = this.username;
    data['truyenid'] = this.truyenid;
    data['tentruyen'] = this.tentruyen;
    data['hinhanh'] = this.hinhanh;
    data['tacgia'] = this.tacgia;
    data['sosao'] = this.sosao;
    data['noidung'] = this.noidung;
    data['ngaydang'] = this.ngaydang;
    return data;
  }
}
