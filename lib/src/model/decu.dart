class Topdecu {
  int? rateid;
  int? truyenId;
  String? username;
  double? sosao;
  int? uid;
  String? content;
  String? photo;
  String? ngaydang;

  Topdecu(
      {this.rateid,
      this.truyenId,
      this.username,
      this.sosao,
      this.uid,
      this.content,
      this.photo,
      this.ngaydang});

  Topdecu.fromJson(Map<String, dynamic> json) {
    rateid = json['rateid'];
    truyenId = json['truyen_id'];
    username = json['username'];
    sosao = json['sosao'];
    uid = json['uid'];
    content = json['content'];
    photo = json['photo'];
    ngaydang = json['ngaydang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rateid'] = this.rateid;
    data['truyen_id'] = this.truyenId;
    data['username'] = this.username;
    data['sosao'] = this.sosao;
    data['uid'] = this.uid;
    data['content'] = this.content;
    data['photo'] = this.photo;
    data['ngaydang'] = this.ngaydang;
    return data;
  }
}
