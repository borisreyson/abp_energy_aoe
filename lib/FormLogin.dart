import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FormLogin extends StatelessWidget {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      //KEMUDIAN MENGGUNAKAN STACK AGAR MUDAH MENGATUR LETAKNNYA SESUAI KEINGINAN
      //KARENA KITA INGIN GAMBAR HEADER DAN FORM LOGIN SALING MEMBELAH
      child: Stack(
        children: <Widget>[
          //SET CONTAINER SEBAGAI BACKGROUND
          Container(
            height: MediaQuery.of(context).size.height,
          ),
          //CONTAINER KEDUA BERISI IMAGE SEPERTI CASE SEBELUMNYA PENJELASANNYA
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ic_abp.png'),
                fit: BoxFit.cover,
              ),
color: Colors.white10
            ),
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
                          "Login Form",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      //KEMUDIAN SEBUAH TEKS FIELD UNTUK MENGINPUT EMAIL
                      TextField(
                        //DIMANA DEKORASINYA PADA SIFFUX BERARTI AKHIR BERISI ICON EMAIL BERWARNA PINK
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.pink[200],
                          ),
                          //KETIKA INPUTAN TERSEBUT DIKLIK MAKA AKAN MEMBUAT UNDERLINE
                          focusedBorder: UnderlineInputBorder(
                            //DENGAN BORDER BERWARNA PINK
                            borderSide: BorderSide(
                              color: Colors.pinkAccent,
                            ),
                          ),
                          labelText: "Email: ", //SET LABELNYA
                          //DAN SET STYLE DARI LABEL, CARA KERJANYA SAMA DENGNA TEXT STYLE KETIKA DISEMATKAN PADA TEXT() WIDGET
                          labelStyle: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //TEXT FIELD UNTUK PASSWORD, ADAPUN PENJELASANNYA SAMA DENGAN CODE DIATAS
                      TextField(
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.security,
                            color: Colors.pink[200],
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
                      ),
                      //TERAKHIR ADALAH TEKS UNTUK FORGOT PASSWORD
                      Padding(
                        //PADDINGNYA KITA SET UNTUK JARAK DARI ATAS BAWAH DAN KANAN
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 5, right: 15.0),
                        //KITA GUNAKAN ALIGN UNTUK MENGATUR POSISINYA
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.blue[400],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
