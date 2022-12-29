class Danhsachchuong {
  int? chuongid;
  String? tenchuong;
  String? slug;

  Danhsachchuong({this.chuongid, this.tenchuong, this.slug});

  Danhsachchuong.fromJson(Map<String, dynamic> json) {
    chuongid = json['chuongid'];
    tenchuong = json['tenchuong'];
    slug = json['slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chuongid'] = this.chuongid;
    data['tenchuong'] = this.tenchuong;
    data['slug'] = this.slug;
    return data;
  }
}
