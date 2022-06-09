import 'package:travel_app/database/Marketler.dart';

import '../VeriTabaniYardimcisi.dart';

class marketDao{
  Future<List<Marketler>> tumMarketler() async {
    var db=await VeriTabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>>maps =await db.rawQuery("SELECT * FROM marketler");

    return List.generate(maps.length, (i) {
      var satir=maps[i];

      return Marketler( satir["ad"], satir["adress"], satir["acikSaatler"], satir["url"]);
    });
  }
}