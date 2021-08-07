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
      title: "PT Alamjaya Bara Pratama",
      home: Scaffold(
        appBar: AppBar(
          title: Text('PT Alamjaya Bara Pratama'),
          backgroundColor: Colors.blue ,
        ),
        body: SingleChildScrollView(

        ),
      ),
    );
  }
}
