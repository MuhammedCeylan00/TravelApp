import 'package:flutter/material.dart';
import 'package:travel_app/DetaySayfalari/otelDetay.dart';
import 'package:travel_app/dao/otelerDao.dart';
import 'package:travel_app/database/oteller.dart';
class oteller extends StatefulWidget {
  const oteller({Key? key}) : super(key: key);

  @override
  State<oteller> createState() => _otellerState();
}

class _otellerState extends State<oteller> {
  Future<List<Oteller>> otelleriGoster() async{
    var otellerListesi=await otellerDao().tumOteller();

    return otellerListesi;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( "oteller"),
      ),
      body:  FutureBuilder<List<Oteller>>(
        future: otelleriGoster(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var otelListesi=snapshot.data;
            return ListView.builder(
              itemCount: 2,
              itemBuilder: (context,index){
                var otel=otelListesi![index];
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child:card(otel.ad,otel.adres,otel.aciklama,otel.fiyat,otel.url),
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
  late String aciklama;
  late int fiyat;
  late String url;
  card(this.ad,this.adres,this.aciklama,this.fiyat,this.url);

  @override
  Widget build(BuildContext context) {
    return  Card(child:ListTile(
        title: Text(ad),
        subtitle: Text(fiyat.toString()),
        leading: CircleAvatar(backgroundImage: NetworkImage(url)),
        trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
            ),
            onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>otelDetay(ad, adres, aciklama, fiyat, url)));

            },
            child:Text("Detay")
        )));
  }
}












