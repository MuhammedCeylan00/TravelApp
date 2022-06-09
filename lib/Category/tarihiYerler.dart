import 'package:flutter/material.dart';
import 'package:travel_app/DetaySayfalari/tarihiYerDetay.dart';
import 'package:travel_app/dao/tarihiYerlerDao.dart';
import 'package:travel_app/database/TarihiYerler.dart';
class tarihiYerler extends StatefulWidget {
  const tarihiYerler({Key? key}) : super(key: key);

  @override
  State<tarihiYerler> createState() => _tarihiYerlerState();
}

class _tarihiYerlerState extends State<tarihiYerler> {
  Future<List<TarihiYerler>> tarihiYerleriGoster() async{
    var tarihiYerlerListesi=await tarihiYerlerDao().tumYerler();

    return tarihiYerlerListesi;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tarihi yerler"),
      ),
      body: FutureBuilder<List<TarihiYerler>>(
        future: tarihiYerleriGoster(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var tarihiYerlerListesi=snapshot.data;
            return ListView.builder(
              itemCount: 2,
              itemBuilder: (context,index){
                var yer=tarihiYerlerListesi![index];
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child:card(yer.ad,yer.aciklama,yer.acikSaatler,yer.adress,yer.url),
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
  late String acikSaatler;
  late String url;

  card(this.ad,this.aciklama,this.acikSaatler,this.adres,this.url);

  @override
  Widget build(BuildContext context) {
    return  Card(child:ListTile(
        title: Text(ad),
        subtitle: Text(adres),
        leading: CircleAvatar(backgroundImage: NetworkImage(url)),
        trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
            ),
            onPressed:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>tarihiYerDetay(ad, adres, aciklama, acikSaatler,url)));
            },
            child:Text("Detay")
        )));
  }
}




