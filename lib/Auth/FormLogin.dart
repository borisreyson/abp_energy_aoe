import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:package_info_plus/package_info_plus.dart';

TextEditingController usernameCtr = TextEditingController();
TextEditingController passwordCtr = TextEditingController();
FocusNode userFocus = FocusNode();
bool _passwordDisable= true;

final _formKey = GlobalKey<FormState>();
class FormLogin extends StatefulWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  @override
  void initState() {
    _passwordDisable = true;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      //KEMUDIAN MENGGUNAKAN STACK AGAR MUDAH MENGATUR LETAKNNYA SESUAI KEINGINAN
      //KARENA KITA INGIN GAMBAR HEADER DAN FORM LOGIN SALING MEMBELAH
      child:Form(
        key: _formKey,
        child:
        Stack(
          children: <Widget>[
            //SET CONTAINER SEBAGAI BACKGROUND
            Container(
              height: MediaQuery.of(context).size.height,
            ),
            //CONTAINER KEDUA BERISI IMAGE SEPERTI CASE SEBELUMNYA PENJELASANNYA
            Container(
              height: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/ic_abp.png'),
                    fit: BoxFit.contain ,
                  ),
                  color: Colors.white10
              ),
              margin: EdgeInsets.only(top: 50.0),
            ),
            //BAGIAN INI KITA GUNAKAN POSITIONED UNTUK MENGATUR SUDUTNYA, JIKA MASIH BINGUNG SOAL MATERI INI BACA NOTE DIBAWAH.
            Positioned(
              //JARAK DARI ATAS KITA AMBIL DARI HEIGHT DIBAGI 3.6
              top: MediaQuery.of(context).size.height / 3.6,
              //ISINYA ADALAH CONTAINER YANG WIDTHNYA SELEBAR MUNGKIN
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Card(
                  //LALU CARD KITA SET MARGINNYA 20 DARI CONTAINER
                  margin: const EdgeInsets.all(20.0),
                  elevation: 8, //KETEBALANNYA
                  child: Padding(
                    //KEMUDIAN COLUMN KITA SET LAGI PADDINGNYA DARI CARD
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //BAGIAN PERTAMA ADALAH TEKS FORM LOGIN
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        //KEMUDIAN SEBUAH TEKS FIELD UNTUK MENGINPUT EMAIL
                        TextFormField(
                          focusNode: userFocus,
                          //DIMANA DEKORASINYA PADA SIFFUX BERARTI AKHIR BERISI ICON EMAIL BERWARNA PINK
                          decoration: InputDecoration(
                            //KETIKA INPUTAN TERSEBUT DIKLIK MAKA AKAN MEMBUAT UNDERLINE
                            focusedBorder: UnderlineInputBorder(
                              //DENGAN BORDER BERWARNA PINK
                              borderSide: BorderSide(
                                color: Colors.pinkAccent,
                              ),
                            ),
                            labelText: "Username: ", //SET LABELNYA
                            //DAN SET STYLE DARI LABEL, CARA KERJANYA SAMA DENGNA TEXT STYLE KETIKA DISEMATKAN PADA TEXT() WIDGET
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          controller: usernameCtr,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tidak Boleh Kosong';
                            }
                            return null;
                          },
                          autocorrect: false,
                          textInputAction: TextInputAction.next,
                        ),
                        //TEXT FIELD UNTUK PASSWORD, ADAPUN PENJELASANNYA SAMA DENGAN CODE DIATAS
                        TextFormField(
                          decoration: InputDecoration(
                            suffixIcon: IconButton(icon: Icon(
                            _passwordDisable?Icons.visibility_off:Icons.visibility,
                            color: Colors.black45,
                            ), onPressed: () {
                              setState(() {
                                _passwordDisable = !_passwordDisable;
                              });
                            },

                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.pinkAccent,
                              ),
                            ),
                            labelText: "Password: ",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Tidak Boleh Kosong';
                            }
                            return null;
                          },
                          controller: passwordCtr,
                          obscureText: _passwordDisable,
                          autocorrect: false,
                          textInputAction: TextInputAction.go,
                        ),
                        Container(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(child: Padding(
                                child: ElevatedButton(
                                  onPressed: (){
                                    if(_formKey.currentState!.validate()){
                                      kirimData(context);
                                    }else{
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Username Atau Password Tidak Boleh Kosong!!")));
                                      userFocus.requestFocus();
                                    }
                                  },
                                  child: const Text("Masuk"),
                                ),
                                padding: EdgeInsets.only(right: 10.0),
                              )
                              ),
                              Expanded(child: Padding(
                                child: ElevatedButton(
                                  onPressed: (){
                                    if(_formKey.currentState!.validate()){
                                      kirimData(context);
                                    }else{
                                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Username Atau Password Tidak Boleh Kosong!!")));
                                      userFocus.requestFocus();
                                    }
                                  },
                                  child: const Text("Daftar"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.red
                                  ),
                                ),
                                padding: EdgeInsets.only(left: 10.0),
                              )
                              ),
                              // NotificationPage(),
                            ],
                          ),
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 10.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),

      )

    );
  }
}

void kirimData(BuildContext context){
  String username = usernameCtr.text;
  String password = passwordCtr.text;
  if(username == "admin" && password =="admin"){
    Navigator.of(context).pushNamed("/home");
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Username : ${username} |  Password : ${password}")));
  }else{
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text("Username atau  Password Salah"),backgroundColor: Colors.red,));
  }
  usernameCtr.clear();
  passwordCtr.clear();
  userFocus.requestFocus();
}
void visible(){
  if(_passwordDisable){
    _passwordDisable = !_passwordDisable;
  }
}
// class NotificationPage extends StatefulWidget {
//   @override
//   // State<StatefulWidget> createState() => NotificationPageState();
// }
// class NotificationPageState extends State<NotificationPage>{
//   FirebaseMessaging fm = FirebaseMessaging.instance;
//   NotificationPageState(){
//     // fm.configure();
//   }
//   // @override
//   // Widget build(BuildContext context) {
//   //
//   // }
// }