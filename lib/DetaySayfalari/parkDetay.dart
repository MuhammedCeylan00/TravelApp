import 'package:flutter/material.dart';

class parkDetay extends StatefulWidget {
  late String ad;
  late String adres;
  late String url;

  parkDetay(this.ad,this.adres,this.url);
  @override
  State<parkDetay> createState() => _parkDetayState();
}

class _parkDetayState extends State<parkDetay> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.ad),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.ad,style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Image.network(widget.url),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.blue,
                        size: 36.0,
                      ),
                      Text(widget.adres,style: TextStyle(fontStyle: FontStyle.italic),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Yorum',
                    ),),
                ),
                ElevatedButton(
                    style:ElevatedButton.styleFrom(
                        primary: Colors.blue
                    ),
                    onPressed: (){
                      print("yorum yapıldı.");
                    },
                    child: Text("Yorum yap",style: TextStyle(color: Colors.white),)
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.deepPurple,
                      border: OutlineInputBorder(),
                      labelText: '1-5 Arasında puanlama yapın',
                    ),),
                ),
                ElevatedButton(
                    style:ElevatedButton.styleFrom(
                        primary: Colors.blue
                    ),
                    onPressed: (){
                      print("puan ver.");
                    },
                    child: Text("Puan ver",style: TextStyle(color: Colors.white),)
                ),
              ],
            ),
        ),
      ),
    );
  }
}
