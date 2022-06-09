import 'package:flutter/material.dart';
import 'package:travel_app/DetaySayfalari/marketDetay.dart';
import 'package:travel_app/dao/marketDao.dart';
import 'package:travel_app/dao/otelerDao.dart';
import 'package:travel_app/database/Marketler.dart';
import 'package:travel_app/database/oteller.dart';
class marketler extends StatefulWidget {
  const marketler({Key? key}) : super(key: key);

  @override
  State<marketler> createState() => _marketlerState();
}

class _marketlerState extends State<marketler> {
  Future<List<Marketler>> marketleriGoster() async{
    var marketListesi=await marketDao().tumMarketler();

    return marketListesi;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Marketler"),
      ),
      body: FutureBuilder<List<Marketler>>(
        future: marketleriGoster(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var marketListesi=snapshot.data;
            return ListView.builder(
              itemCount: 2,
              itemBuilder: (context,index){
                var market=marketListesi![index];
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child:card(market.ad,market.adres,market.acik_saatler,market.url),
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
  late String acik_saatler;
  late String url;

  card(this.ad,this.adres,this.acik_saatler,this.url);

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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>marketDetay(ad, adres, acik_saatler, url)));
            },
            child:Text("Detay")
        )));
  }
}

















