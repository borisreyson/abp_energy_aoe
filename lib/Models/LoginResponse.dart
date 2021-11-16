class LoginResponse {
  LoginResponse({
    required this.success,
    required this.user,
  });
  late final bool success;
  late final User user;
  
  LoginResponse.fromJson(Map<String, dynamic> json){
    success = json['success'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['user'] = user.toJson();
    return _data;
  }
}

class User {
  User({
    required this.idUser,
    required this.username,
    required this.password,
    required this.namaLengkap,
    required this.email,
    required this.department,
    required this.section,
    required this.level,
    required this.idSession,
    required this.status,
    required this.ttd,
    required this.rule,
    required this.tglentry,
    required this.nik,
    required this.perusahaan,
    required this.photoProfile,
    required this.userUpdate,
  });
  late final int idUser;
  late final String username;
  late final String password;
  late final String namaLengkap;
  late final String email;
  late final String department;
  late final String section;
  late final String level;
  late final String idSession;
  late final int status;
  late final Null ttd;
  late final String rule;
  late final String tglentry;
  late final String nik;
  late final int perusahaan;
  late final String photoProfile;
  late final String userUpdate;
  
  User.fromJson(Map<String, dynamic> json){
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
    final _data = <String, dynamic>{};
    _data['id_user'] = idUser;
    _data['username'] = username;
    _data['password'] = password;
    _data['nama_lengkap'] = namaLengkap;
    _data['email'] = email;
    _data['department'] = department;
    _data['section'] = section;
    _data['level'] = level;
    _data['id_session'] = idSession;
    _data['status'] = status;
    _data['ttd'] = ttd;
    _data['rule'] = rule;
    _data['tglentry'] = tglentry;
    _data['nik'] = nik;
    _data['perusahaan'] = perusahaan;
    _data['photo_profile'] = photoProfile;
    _data['user_update'] = userUpdate;
    return _data;
  }
}