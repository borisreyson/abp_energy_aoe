
import 'package:abp_energy_aoe/screens/page/home.dart';
import 'package:abp_energy_aoe/splash.dart';
import 'package:flutter/material.dart';
import "package:flutter/services.dart";
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'dart:io' show Platform;

import 'package:shared_preferences/shared_preferences.dart';
Future main() async {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp,DeviceOrientation.portraitDown]);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: _mainPage()

          );
  }
  _mainPage(){
    if(Platform.isAndroid){
      return AnimatedSplashScreen(splash: Image.asset('assets/images/ic_abp.png'),duration: 1500,splashTransition: SplashTransition.scaleTransition, nextScreen: Splash());
      // Splash();
    }else if(Platform.isIOS){
      return AnimatedSplashScreen(splash: Image.asset('assets/images/ic_abp.png'),duration: 1500,splashTransition: SplashTransition.scaleTransition, nextScreen: Splash());
    }
  }
}
