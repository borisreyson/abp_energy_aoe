import 'package:flutter/material.dart';

class Splash extends StatefulWidget{
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _Splash();

}
class _Splash extends State<Splash>{
  @override
  void initState() {
    super.initState();
    _navigateHome();
  }
  _navigateHome() async{
    await Future.delayed(Duration(milliseconds: 1500),(){});
    // Navigator.of(context).pushNamed("/login");
  }
  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
        backgroundColor:
        lightMode ? const Color(0xffffffff) : const Color(0xffffffff),
        body:Center(
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100,width: 100,
                  child: lightMode
                      ? Image.asset('assets/images/ic_abp.png')
                      : Image.asset('assets/images/ic_abp.png'),
                )
              ],
            )
            ,


        )

    );
  }
}
