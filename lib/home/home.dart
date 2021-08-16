import 'package:abp_energy_aoe/home/content.dart';
import 'package:abp_energy_aoe/home/header.dart';
import 'package:flutter/material.dart';
class HomeApss extends StatefulWidget {
  const HomeApss({Key? key}) : super(key: key);

  @override
  _HomeApssState createState() => _HomeApssState();
}

class _HomeApssState extends State<HomeApss> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "PT Alamjaya Bara Pratama",
      home: Scaffold(
        backgroundColor: Color.fromRGBO(2, 61, 117, 46),
        body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                HeaderHome(),
                ContentHome()
              ],
            ),
        ),
      ),
    );
  }
}
