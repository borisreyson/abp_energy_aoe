import 'package:flutter/material.dart';

class HeaderHome extends StatefulWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  _HeaderHomeState createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: MediaQuery.of(context).size.height/3,
      child: Positioned(
        top: MediaQuery.of(context).size.height/3.4,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Stack(
              children:<Widget> [
                Container(
                  padding: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child:Card(
                    elevation: 10,
                    margin: EdgeInsets.all(50),
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[

                        ],
                      )
                      ,
                    ),
                  ),

                ),
                Container(
                    width: MediaQuery.of(context).size.width,
                    alignment:Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Expanded(child: Container(
                          height: MediaQuery.of(context).size.height/3,
                          margin: EdgeInsets.all(18),
                          child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(15),
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/ic_abp.png'),
                                      fit: BoxFit.contain ,
                                    ),
                                  ),
                                ),
                              )
                          ),
                        ),

                        ),
                        Expanded(child: Container(

                        ))
                      ],
                    )
                )
              ]

          ),
        ),
      )
      ,
    );

  }
}
