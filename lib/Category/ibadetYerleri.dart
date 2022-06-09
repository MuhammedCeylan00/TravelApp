import 'package:flutter/material.dart';
import 'package:travel_app/DetaySayfalari/ibadethaneDetay.dart';
import 'package:travel_app/database/IbadetYeri.dart';
import 'package:travel_app/database/ibadetYeriDao.dart';
class ibadetYerleri extends StatefulWidget {
  const ibadetYerleri({Key? key}) : super(key: key);

  @override
  State<ibadetYerleri> createState() => _ibadetYerleriState();
}

class _ibadetYerleriState extends State<ibadetYerleri> {
  Future<List<IbadetYeri>> yerleriGoster() async{
    var yerListesi=await ibadetYeriDao().tumIbadetYerleri();

    return yerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ibadet yerleri"),
      ),
      body: FutureBuilder<List<IbadetYeri>>(
        future: yerleriGoster(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var yerListesi=snapshot.data;
            return ListView.builder(
              itemCount: 2,
              itemBuilder: (context,index){
                var ibadetYeri=yerListesi![index];
                return Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child:card(ibadetYeri.ad,ibadetYeri.adres,ibadetYeri.aciklama,ibadetYeri.url),
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
  late String url;

  card(this.ad,this.adres,this.aciklama,this.url);
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
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ibadethaneDetay(ad, adres, aciklama,url)));
            },
            child:Text("Detay")
        )));
  }
}




