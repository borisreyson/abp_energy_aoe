import 'package:abp_energy_aoe/home/home.dart';
import 'package:abp_energy_aoe/login.dart';
import 'package:flutter/material.dart';
import "package:flutter/services.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => LoginForm(),
        '/home':(context) => HomeApss()

      },
    );
  }
}
