import 'package:abp_energy_aoe/Home/home.dart';
import 'package:abp_energy_aoe/Auth/login.dart';
import 'package:abp_energy_aoe/splash.dart';
import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: AnimatedSplashScreen(splash: Image.asset('assets/images/ic_abp.png'),duration: 1500,splashTransition: SplashTransition.scaleTransition, nextScreen: LoginForm(),),
            routes: {
              // '/': (context) => Splash(),
              '/home': (context) => HomeApss(),
              '/login': (context) => LoginForm(),
              '/register': (context) => LoginForm()
            },
          );
  }
}
