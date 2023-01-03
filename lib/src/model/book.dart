import 'decu.dart';
import 'list_chapter.dart';

class Book {
  int? id;
  String? tentruyen;
  String? hinhanh;
  String? slug;
  String? mota;
  String? tacgia;
  int? luotxem;
  String? ngaydang;
  int? chuongslug;
  bool? bookmark;
  String? thoigiancapnhat;
  double? sosao;
  int? sochuong;
  int? tinhtrang;
  int? trangthai;
  String? theloai;
  String? tinhcach;
  String? thegioi;
  String? luuphai;
  List<Danhsachchuong>? danhsachchuong;
  List<Topdecu>? topdecu;

  Book(
      {this.id,
      this.tentruyen,
      this.hinhanh,
      this.slug,
      this.mota,
      this.tacgia,
      this.luotxem,
      this.ngaydang,
      this.chuongslug,
      this.bookmark,
      this.thoigiancapnhat,
      this.sosao,
      this.sochuong,
      this.tinhtrang,
      this.trangthai,
      this.theloai,
      this.tinhcach,
      this.thegioi,
      this.luuphai,
      this.danhsachchuong,
      this.topdecu});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tentruyen = json['tentruyen'];
    hinhanh = json['hinhanh'];
    slug = json['slug'];
    mota = json['mota'];
    tacgia = json['tacgia'];
    luotxem = json['luotxem'];
    ngaydang = json['ngaydang'];
    chuongslug = json['chuongslug'];
    bookmark = json['bookmark'];
    thoigiancapnhat = json['thoigiancapnhat'];
    sosao = json['sosao'];
    sochuong = json['sochuong'];
    tinhtrang = json['tinhtrang'];
    trangthai = json['trangthai'];
    theloai = json['theloai'];
    tinhcach = json['tinhcach'];
    thegioi = json['thegioi'];
    luuphai = json['luuphai'];
    if (json['danhsachchuong'] != null) {
      danhsachchuong = <Danhsachchuong>[];
      json['danhsachchuong'].forEach((v) {
        danhsachchuong!.add(new Danhsachchuong.fromJson(v));
      });
    }
    if (json['topdecu'] != null) {
      topdecu = <Topdecu>[];
      json['topdecu'].forEach((v) {
        topdecu!.add(new Topdecu.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['tentruyen'] = this.tentruyen;
    data['hinhanh'] = this.hinhanh;
    data['slug'] = this.slug;
    data['mota'] = this.mota;
    data['tacgia'] = this.tacgia;
    data['luotxem'] = this.luotxem;
    data['ngaydang'] = this.ngaydang;
    data['chuongslug'] = this.chuongslug;
    data['bookmark'] = this.bookmark;
    data['thoigiancapnhat'] = this.thoigiancapnhat;
    data['sosao'] = this.sosao;
    data['sochuong'] = this.sochuong;
    data['tinhtrang'] = this.tinhtrang;
    data['trangthai'] = this.trangthai;
    data['theloai'] = this.theloai;
    data['tinhcach'] = this.tinhcach;
    data['thegioi'] = this.thegioi;
    data['luuphai'] = this.luuphai;
    if (this.danhsachchuong != null) {
      data['danhsachchuong'] =
          this.danhsachchuong!.map((v) => v.toJson()).toList();
    }
    if (this.topdecu != null) {
      data['topdecu'] = this.topdecu!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
