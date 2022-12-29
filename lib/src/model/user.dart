class User {
  int? id;
  String? email;
  String? username;
  String? password;
  String? numberphone;
  String? avatar;
  String? yearofbirth;
  int? sex;
  String? introduce;
  int? lever;
  String? joindate;
  int? sohoa;

  User(
      {this.id,
      this.email,
      this.username,
      this.password,
      this.numberphone,
      this.avatar,
      this.yearofbirth,
      this.sex,
      this.introduce,
      this.lever,
      this.joindate,
      this.sohoa});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    numberphone = json['numberphone'];
    avatar = json['avatar'];
    yearofbirth = json['yearofbirth'];
    sex = json['sex'];
    introduce = json['introduce'];
    lever = json['lever'];
    joindate = json['joindate'];
    sohoa = json['sohoa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.password;
    data['numberphone'] = this.numberphone;
    data['avatar'] = this.avatar;
    data['yearofbirth'] = this.yearofbirth;
    data['sex'] = this.sex;
    data['introduce'] = this.introduce;
    data['lever'] = this.lever;
    data['joindate'] = this.joindate;
    data['sohoa'] = this.sohoa;
    return data;
  }
}
