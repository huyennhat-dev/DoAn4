class Chapter {
  int? id;
  int? truyenId;
  String? tenchuong;
  String? slug;
  String? noidung;
  String? ngaydang;
  int? luotdoc;
  int? trangthai;

  Chapter(
      {this.id,
      this.truyenId,
      this.tenchuong,
      this.slug,
      this.noidung,
      this.ngaydang,
      this.luotdoc,
      this.trangthai});

  Chapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    truyenId = json['truyen_id'];
    tenchuong = json['tenchuong'];
    slug = json['slug'];
    noidung = json['noidung'];
    ngaydang = json['ngaydang'];
    luotdoc = json['luotdoc'];
    trangthai = json['trangthai'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['truyen_id'] = this.truyenId;
    data['tenchuong'] = this.tenchuong;
    data['slug'] = this.slug;
    data['noidung'] = this.noidung;
    data['ngaydang'] = this.ngaydang;
    data['luotdoc'] = this.luotdoc;
    data['trangthai'] = this.trangthai;
    return data;
  }
}
