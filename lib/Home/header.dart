import 'package:abp_energy_aoe/API/ApiServices.dart';
import 'package:abp_energy_aoe/Models/ResponseCsrfToken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
var csrfToken="0";
class HeaderHome extends StatefulWidget {
  const HeaderHome({Key? key}) : super(key: key);

  @override
  _HeaderHomeState createState() => _HeaderHomeState();
}

class _HeaderHomeState extends State<HeaderHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      height: MediaQuery.of(context).size.height / 2.6,
      child: Positioned(
        top: MediaQuery.of(context).size.height / 3.4,
        child: FutureBuilder<ResponseCsrfToken>(
            future: ApiServices.getToken(),
            builder: (context,snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator();
              }else{
                if(snapshot.hasData){
                  // csrfToken = snapshot.data!.csrfToken;
                  csrfToken = "0";
                }else{
                   csrfToken = "0";
                }

                return  Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Stack(children: <Widget>[

                    Container(
                      padding: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Card(
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        ),
                        margin: EdgeInsets.all(50),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Expanded(
                                      child: Text(
                                        "Hazard",
                                        style: TextStyle(fontSize: 12),
                                        textAlign: TextAlign.center,
                                      )),
                                  Expanded(child: Container()),
                                  Expanded(
                                      child: Text(
                                        "Inspeksi",
                                        style: TextStyle(fontSize: 12),
                                        textAlign: TextAlign.center,
                                      ))
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                        child: Text(
                                          "$csrfToken",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        )),
                                    Expanded(child: Container()),
                                    Expanded(
                                        child: Text(
                                          "0",
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 2),
                                color: Color.fromRGBO(2, 61, 117, 46),
                                width: MediaQuery.of(context).size.width,
                                height: 1,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 2,bottom: 2),
                                child: Text(
                                  "Boris Reyson Sitorus",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              Text(
                                "18060207",
                                style: TextStyle(
                                    fontSize: 12, decoration: TextDecoration.underline),
                              ),
                              Padding(padding: EdgeInsets.only(top: 4),child:Text(
                                "Information and Technology",
                                style: TextStyle(
                                  fontSize: 10, ),
                              ) ,)
                              ,
                              Padding(padding: EdgeInsets.only(top: 2),child:Text(
                                "HGE & External",
                                style: TextStyle(
                                  fontSize: 12,),
                              ),),

                              Padding(padding: EdgeInsets.only(top: 2),child:Text(
                                  "PT Alamjaya Bara Pratama",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,fontSize: 12
                                  )
                              ),)

                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                height: MediaQuery.of(context).size.height / 3,
                                margin: EdgeInsets.all(27),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    color: Color.fromRGBO(2, 61, 117, 46),
                                    child: Padding(
                                        padding: EdgeInsets.all(1),
                                        child: Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(50)),
                                            child: Padding(
                                              padding: EdgeInsets.all(15),
                                              child: Container(
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/ic_abp.png'),
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            )))),
                              ),
                            ),
                            Expanded(child: Container())
                          ],
                        ))
                  ]),
                );
            }
            }),
      ),
    );
  }
}
