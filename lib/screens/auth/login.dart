import 'package:abp_energy_aoe/model/LoginModel.dart';
import 'package:abp_energy_aoe/screens/auth/register.dart';
import 'package:abp_energy_aoe/screens/page/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  late FocusNode _usernameFocus, _passwordFocus;
  late String _username, _password;
  PostLogin? postLogins;
  SharedPreferences? sharedPref;
  int? isLogin;
  bool _passwordVisible = false;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  RoundedLoadingButtonController _roundedController =
      RoundedLoadingButtonController();
  @override
  void initState() {
    getPref(context);
    _usernameFocus = FocusNode();
    _passwordFocus = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _usernameFocus.dispose();
    _passwordFocus.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  _onLogin(BuildContext context) async {
    final form = _formKey.currentState;
    if (form!.validate()) {
      _roundedController.start();
      form.save();
      String username = _username;
      String password = _password;
      PostLogin.loginToApi(username, password).then((value) {
        postLogins = value;
        if (postLogins != null) {
          setPref(
              1,
              postLogins!.username!,
              postLogins!.namaLengkap!,
              postLogins!.nik!,
              postLogins!.rule!,
              postLogins!.department,
              postLogins!.perusahaan!,
              postLogins!.photoProfile!);

          Future.delayed(const Duration(milliseconds: 1000), () {
            _roundedController.success();
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Login Berhasil!!")));
            Future.delayed(Duration(milliseconds: 1000), () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (BuildContext context) => HomePage()));
            });
          });
        } else {
          _usernameFocus.requestFocus();
          Future.delayed(Duration(milliseconds: 1000), () {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Username Atau Password Salah!!")));
            _roundedController.error();
            _usernameController.clear();
            _passwordController.clear();
            Future.delayed(Duration(milliseconds: 1000), () {
              _roundedController.reset();
            });
          });
        }
      });
    } else {
      Future.delayed(Duration(milliseconds: 1000), () {
        _autoValidate = true;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Username Atau Password Tidak Boleh Kosong!!")));
        _usernameFocus.requestFocus();
          _roundedController.reset();
        
      });
    }
  }

  setPref(int login, String username, String nama, String nik, String rule,
      String? departemen, String perusahaan, String photoProfile) async {
    sharedPref = await SharedPreferences.getInstance();
    sharedPref?.setInt("isLogin", login);
    sharedPref?.setString("username", username);
    sharedPref?.setString("nama", nama);
    sharedPref?.setString("nik", nik);
    sharedPref?.setString("rule", rule);
    if (departemen != null) {
      sharedPref?.setString("departemen", departemen);
    }
    sharedPref?.setString("perusahaan", perusahaan);
    sharedPref?.setString("photo_profile", photoProfile);
  }

  getPref(BuildContext context) async {
    sharedPref = await SharedPreferences.getInstance();
    isLogin = sharedPref?.getInt("isLogin");
    if (isLogin == 1) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    } else {
      print("$isLogin || Not Login");
    }
  }

  void toggleVisible() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          child: Icon(Icons.arrow_back_ios_new),
          onTap: () {
            Navigator.maybePop(context);
          },
        ),
      ),
      key: _globalKey,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: ListView(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/ic_abp.png'),
                            fit: BoxFit.contain,
                          ),
                          color: Colors.white10),
                      margin: EdgeInsets.only(top: 50.0),
                    )),
                TextFormField(
                  focusNode: _usernameFocus,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), labelText: "Username"),
                  onSaved: (value) {
                    _username = value!;
                  },
                  onFieldSubmitted: (term) {
                    _usernameFocus.unfocus();
                    FocusScope.of(context).requestFocus(_passwordFocus);
                  },
                  validator: (value) {
                    final isValidateUsername = RegExp(r'^[a-zA-Z0-9]*$');
                    if (value!.isEmpty) {
                      return 'Username Wajib Di Isi';
                    } else if (!isValidateUsername.hasMatch(value)) {
                      return 'Only letters are allowed';
                    }
                    return null;
                  },
                  controller: _usernameController,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  focusNode: _passwordFocus,
                  obscureText: _passwordVisible,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Password",
                      hintText: "Password",
                      suffixIcon: IconButton(
                          icon: _passwordVisible
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            _passwordFocus.unfocus();
                            toggleVisible();
                          })),
                  onSaved: (value) {
                    _password = value!;
                  },
                  onFieldSubmitted: (term) {
                    _passwordFocus.unfocus();
                    _onLogin(context);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Password Wajib Di Isi';
                    }
                    return null;
                  },
                  controller: _passwordController,
                ),
                SizedBox(
                  height: 16.0,
                ),
                Expanded(
                    child: RoundedLoadingButton(
                        controller: _roundedController,
                        onPressed: () {
                          _roundedController.start();
                          _onLogin(context);
                        },
                        child: Text(
                          "Masuk",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ))),
              ],
            )),
      )),
    );
  }
}
