import 'package:flutter/material.dart';
import 'package:travel_app/DetaySayfalari/parkDetay.dart';
import 'package:travel_app/dao/parklardao.dart';
import 'package:travel_app/database/Parklar.dart';

class parklar extends StatefulWidget {


  @override
  State<parklar> createState() => _parklarState();
}

class _parklarState extends State<parklar> {
  Future<List<Parklar>> parklariGoster() async{
    var parklarListesi=await parklardao().tumParklar();

    return parklarListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text("Güneşin doğduğu yer : Van",style: TextStyle(color: Colors.white),),
        ),
        body:FutureBuilder<List<Parklar>>(
          future: parklariGoster(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              var parklarListesi=snapshot.data;
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context,index){
                  var park=parklarListesi![index];
                  return Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child:card(park.ad,park.adress,park.url),
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

  card(this.ad,this.adres,this.url);

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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>parkDetay(ad, adres, url)));
            },
            child:Text("Detay")
        )));
  }
}

