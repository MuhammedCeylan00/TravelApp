import 'package:flutter/material.dart';
import 'package:travel_app/dao/Kullanicidao.dart';
import 'package:travel_app/login/login.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {

  var ad=TextEditingController();
  var soyad=TextEditingController();
  var eposta=TextEditingController();
  var sifre=TextEditingController();

  Future<void> kayit(String ad,String soyad,String eposta,String sifre)async{
    await Kullanicidao().kullaniciEkle(ad, soyad, eposta, sifre);
    Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
  }


  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYukseklik=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Güneşin doğduğu yer: van"),
      ),
      body: Padding(
        padding: EdgeInsets.all(ekranGenisligi/40),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding:EdgeInsets.all(ekranGenisligi/25),
                  child: TextField(
                    controller: ad,
                    decoration: InputDecoration(
                        hintText: "Ad",
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.deepPurple,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.all(ekranGenisligi/25),
                  child: TextField(
                    controller: soyad,
                    decoration: InputDecoration(
                        hintText: "Soyad",
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.deepPurple,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding:EdgeInsets.all(ekranGenisligi/25),
                  child: TextField(
                    controller: eposta,
                    decoration: InputDecoration(
                        hintText: "E-posta",
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.deepPurple,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(ekranGenisligi/25),
                  child: TextField(
                    controller: sifre,
                    decoration: InputDecoration(
                        hintText: "Şifre",
                        hintStyle: TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Colors.deepPurple,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        )
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(ekranGenisligi/20),
                  child: SizedBox(
                    width: ekranGenisligi/2,
                    height: ekranYukseklik/20,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurple
                        ),
                        onPressed:(){
                          kayit(ad.text, soyad.text, eposta.text, sifre.text);
                        } ,
                        child:Text("Kayıt ol")
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Text("Giriş yap",
                    style: TextStyle(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                        fontSize: ekranGenisligi/25
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}
