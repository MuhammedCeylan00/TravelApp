import 'package:flutter/material.dart';
import 'package:travel_app/DetaySayfalari/otoparkDetay.dart';
import 'package:travel_app/dao/otoparklarDao.dart';
import 'package:travel_app/database/Otoparklar.dart';
class otoparklar extends StatefulWidget {
  const otoparklar({Key? key}) : super(key: key);

  @override
  State<otoparklar> createState() => _otoparklarState();
}

class _otoparklarState extends State<otoparklar> {
  Future<List<Otoparklar>> otoparklariGoster() async {
    var otoparklarListesi = await otoparklarDao().tumOtoparklar();

    return otoparklarListesi;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("otoparklar"),
      ),
      body: FutureBuilder<List<Otoparklar>>(
        future: otoparklariGoster(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var otoparklarListesi=snapshot.data;
            return ListView.builder(
              itemCount: 2,
              itemBuilder: (context,index){
                var park=otoparklarListesi![index];
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child:card(park.ad,park.adres,park.url,park.acik_saatler,park.fiyat),
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
  late int fiyat;

  card(this.ad,this.adres,this.url,this.acik_saatler,this.fiyat);

  @override
  Widget build(BuildContext context) {
    return Card(child:ListTile(
        title: Text(ad),
        subtitle: Text("Fiyat: $fiyat tl"),
        leading: CircleAvatar(backgroundImage: NetworkImage(url)),
        trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
            ),
            onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>otoparkDetay(ad, adres, url, acik_saatler, fiyat)));
            },
            child:Text("Detay")
        )));
  }
}

