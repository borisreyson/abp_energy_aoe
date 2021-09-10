import 'package:flutter/material.dart';

class ContentHome extends StatefulWidget {
  const ContentHome({Key? key}) : super(key: key);

  @override
  _ContentHomeState createState() => _ContentHomeState();
}

class _ContentHomeState extends State<ContentHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Colors.white,
      height: MediaQuery.of(context).size.height,
    );
  }
}
