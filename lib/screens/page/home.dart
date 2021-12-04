import 'package:abp_energy_aoe/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
              IconButton(
                onPressed: () {
                  _logOut();
                },
                icon: Icon(
                  Icons.logout,
                  size: 15.0,
                ),
              
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            child: ListView(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () {
                      _logOut();
                    },
                    child: Text("Log Out"))
              ],
            ),
          ),
        ));
  }

  _logOut() async {
    var _pref = await SharedPreferences.getInstance();
    var isLogin = _pref.getInt("isLogin");
    if (isLogin == 1) {
      _pref.setInt("isLogin", 0);
      setState(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => Splash()));
      });
    } else {}
  }
}
