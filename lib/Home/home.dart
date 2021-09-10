import 'package:abp_energy_aoe/home/content.dart';
import 'package:abp_energy_aoe/home/header.dart';
import 'package:flutter/material.dart';
class HomeApss extends StatefulWidget {
  const HomeApss({Key? key}) : super(key: key);
  @override
  _HomeApssState createState() => _HomeApssState();
}

class _HomeApssState extends State<HomeApss> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
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
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Color(0xff506AD4),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.create_new_folder),
              label: 'New Form',
              backgroundColor: Color(0xff04B142),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'School',
              backgroundColor: Color(0xffF2A007),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
              backgroundColor: Color(0xffD9043D),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF0D0D0D),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
