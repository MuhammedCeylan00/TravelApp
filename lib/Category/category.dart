import 'package:flutter/material.dart';
import 'package:travel_app/Category/ibadetYerleri.dart';
import 'package:travel_app/Category/kutuphaneler.dart';
import 'package:travel_app/Category/marketler.dart';
import 'package:travel_app/Category/oteller.dart';
import 'package:travel_app/Category/otoparklar.dart';
import 'package:travel_app/Category/parklar.dart';
import 'package:travel_app/Category/tarihiYerler.dart';

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYukseklik=ekranBilgisi.size.height;
    final double ekranGenisligi=ekranBilgisi.size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("Güneşin doğduğu yer : Van"),
      ),
      body:SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(0,ekranYukseklik/6,0,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: ekranGenisligi/2,
                  child: ElevatedButton.icon(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>parklar()));
                      },
                      icon: Icon( // <-- Icon
                      Icons.waterfall_chart,
                      size: 24.0,
                    ),
                    label: Text('Parklar'),
                  ),
                ),
                SizedBox(
                  width: ekranGenisligi/2,
                  child: ElevatedButton.icon(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>kutuphaneler()));
                      },
                    icon: Icon( // <-- Icon
                      Icons.menu_book_sharp,
                      size: 24.0,
                    ),
                    label: Text('Kütüphaneler'),
                  ),
                ),
                SizedBox(
                  width: ekranGenisligi/2,
                  child: ElevatedButton.icon(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>tarihiYerler()));
                      },
                    icon: Icon( // <-- Icon
                      Icons.history,
                      size: 24.0,
                    ),
                    label: Text('Tarihi yerler'),
                  ),
                ),
                SizedBox(
                  width: ekranGenisligi/2,
                  child: ElevatedButton.icon(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>oteller()));
                      },
                    icon: Icon( // <-- Icon
                      Icons.hotel,
                      size: 24.0,
                    ),
                    label: Text('Oteller'),),
                ),
                SizedBox(
                  width: ekranGenisligi/2,
                  child: ElevatedButton.icon(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>marketler()));
                      },
                    icon: Icon( // <-- Icon
                      Icons.shopping_cart_outlined,
                      size: 24.0,
                    ),
                    label: Text('Marketler'),),
                ),
                SizedBox(
                  width: ekranGenisligi/2,
                  child: ElevatedButton.icon(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ibadetYerleri()));
                      },
                    icon: Icon( // <-- Icon
                      Icons.mosque,
                      size: 24.0,
                    ),
                    label: Text('İbadet yerleri'),),
                ),
                SizedBox(
                  width: ekranGenisligi/2,
                  child: ElevatedButton.icon(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>otoparklar()));
                      },
                    icon: Icon( // <-- Icon
                      Icons.local_parking_rounded,
                      size: 24.0,
                    ),
                    label: Text('Otoparklar'),),
                ),
                SizedBox(
                  width: ekranGenisligi/2,
                  child: ElevatedButton.icon(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>otoparklar()));
                    },
                    icon: Icon( // <-- Icon
                      Icons.favorite,
                      size: 24.0,
                    ),
                    label: Text('Favori yerler'),),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}


