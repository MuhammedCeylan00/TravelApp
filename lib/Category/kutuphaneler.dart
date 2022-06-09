import 'package:flutter/material.dart';
import 'package:travel_app/DetaySayfalari/kutuphaneDetay.dart';
import 'package:travel_app/dao/kutuphanelerdao.dart';
import 'package:travel_app/database/Kutuphaneler.dart';
class kutuphaneler extends StatefulWidget {
  const kutuphaneler({Key? key}) : super(key: key);

  @override
  State<kutuphaneler> createState() => _kutuphanelerState();
}

class _kutuphanelerState extends State<kutuphaneler> {
  Future<List<Kutuphaneler>> kutuphaneleriGoster() async{
    var parklarListesi=await kutuphaneDao().kutuphaneleriGoster();

    return parklarListesi;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("kütüphaneler"),
      ),
        body:FutureBuilder<List<Kutuphaneler>>(
          future: kutuphaneleriGoster(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              var kutuphaneListesi=snapshot.data;
              return ListView.builder(
                itemCount: 2,
                itemBuilder: (context,index){
                  var kutuphane=kutuphaneListesi![index];
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child:card(kutuphane.ad,kutuphane.adres,kutuphane.url,kutuphane.acikSaatler,kutuphane.aciklama),
                        ),
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
class card extends StatelessWidget {

  late String ad;
  late String adres;
  late String url;
  late String acikSaatler;
  late String aciklama;

  card(this.ad,this.adres,this.url,this.acikSaatler,this.aciklama);
  @override
  Widget build(BuildContext context) {
    return Card(child:ListTile(
        title: Text(ad),
        subtitle: Text(adres),
        leading: CircleAvatar(backgroundImage: NetworkImage(url)),
        trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
            ),
            onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>kutuphaneDetay(ad,aciklama, adres, acikSaatler, url)));
            },
            child:Text("Detay")
        )))       ;
  }
}


