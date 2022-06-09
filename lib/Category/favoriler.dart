import 'package:flutter/material.dart';

class favoriler extends StatefulWidget {
  const favoriler({Key? key}) : super(key: key);

  @override
  State<favoriler> createState() => _favorilerState();
}

class _favorilerState extends State<favoriler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("otoparklar"),
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            card("dhsddshdksd","https://imgcy.trivago.com/f_auto,q_auto/hardcodedimages/lightbox_heroshot.png")
          ],
        )
    );
  }
}
class card extends StatelessWidget {

  late String ad;
  late String url;

  card(this.ad,this.url);
  @override
  Widget build(BuildContext context) {
    return Card(child:ListTile(
        title: Text(ad),
        leading: CircleAvatar(backgroundImage: NetworkImage(url)),
        trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.deepPurple,
            ),
            onPressed:(){
                print("tıklandı");
            },
            child:Text("Detay")
        )));
  }

  }


