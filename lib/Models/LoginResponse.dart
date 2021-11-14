class LoginRespnse {
  bool success;
  User user;

  LoginRespnse({this.success, required this.user});

  LoginRespnse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  int idUser;
  String username;
  String password;
  String namaLengkap;
  String email;
  String department;
  String section;
  String level;
  String idSession;
  int status;
  Null ttd;
  String rule;
  String tglentry;
  String nik;
  int perusahaan;
  String photoProfile;
  String userUpdate;

  User(
      {this.idUser,
      this.username,
      this.password,
      this.namaLengkap,
      this.email,
      this.department,
      this.section,
      this.level,
      this.idSession,
      this.status,
      this.ttd,
      this.rule,
      this.tglentry,
      this.nik,
      this.perusahaan,
      this.photoProfile,
      this.userUpdate});

  User.fromJson(Map<String, dynamic> json) {
    idUser = json['id_user'];
    username = json['username'];
    password = json['password'];
    namaLengkap = json['nama_lengkap'];
    email = json['email'];
    department = json['department'];
    section = json['section'];
    level = json['level'];
    idSession = json['id_session'];
    status = json['status'];
    ttd = json['ttd'];
    rule = json['rule'];
    tglentry = json['tglentry'];
    nik = json['nik'];
    perusahaan = json['perusahaan'];
    photoProfile = json['photo_profile'];
    userUpdate = json['user_update'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_user'] = this.idUser;
    data['username'] = this.username;
    data['password'] = this.password;
    data['nama_lengkap'] = this.namaLengkap;
    data['email'] = this.email;
    data['department'] = this.department;
    data['section'] = this.section;
    data['level'] = this.level;
    data['id_session'] = this.idSession;
    data['status'] = this.status;
    data['ttd'] = this.ttd;
    data['rule'] = this.rule;
    data['tglentry'] = this.tglentry;
    data['nik'] = this.nik;
    data['perusahaan'] = this.perusahaan;
    data['photo_profile'] = this.photoProfile;
    data['user_update'] = this.userUpdate;
    return data;
  }
}
