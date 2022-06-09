import 'package:flutter/material.dart';
import 'package:travel_app/Category/category.dart';
import 'package:travel_app/login/register.dart';

import '../dao/Kullanicidao.dart';
import '../database/Kullanici.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final myController=TextEditingController();
  final myController2=TextEditingController();

  Future<void> kontrol(String eposta,String sifre)async{
    var kullaniciListesi=await Kullanicidao().tumKullanicilar();

    for(Kullanici k in kullaniciListesi){
      if(k.eposta==eposta && k.sifre==sifre){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>category()));
      }
    }
  }

  Future<List<Kullanici>> kullanicilariGoster() async{
    var kullaniciListesi=await Kullanicidao().tumKullanicilar();

    return kullaniciListesi;

  }

  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYukseklik=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;
    late String eposta;
    late String sifre;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Güneşin doğduğu yer : Van",style: TextStyle(color: Colors.white),),
      ),
      body:FutureBuilder<List<Kullanici>>(
        future: kullanicilariGoster(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var kullanicilarListesi=snapshot.data;
            return ListView.builder(
                itemCount: 1,
                itemBuilder: (context,index){
                  var kullanici=kullanicilarListesi![index];
                  print(kullanici.eposta);
                  print(kullanici.sifre);
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(ekranGenisligi/10),
                          child: Text("Yeni yerleri bilerek gezmenin muhteşem tadı",
                            style: TextStyle(
                              color: Colors.deepPurple,
                              fontSize: ekranYukseklik/20,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w700,
                            ),),
                        ),
                        Padding(
                          padding:EdgeInsets.all(ekranGenisligi/25),
                          child: TextField(
                            controller: myController,
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
                            obscureText: true,
                            obscuringCharacter: "*",
                            controller: myController2,
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
                                  kullanicilariGoster();
                                  print(myController.text);
                                  print(myController2.text);
                                  kontrol(myController.text, myController2.text);
                                } ,
                                child:Text("Giriş yap")
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>register()));
                          },
                          child: Text("Kayıt ol",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold,
                                fontSize: ekranGenisligi/25
                            ),
                          ),
                        )

                      ],
                    ),
                  );
                },
            );
          }else{
            return Center();
          }
        },
      )
    );
  }

}
