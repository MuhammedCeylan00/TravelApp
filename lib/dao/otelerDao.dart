import 'package:travel_app/database/oteller.dart';

import '../VeriTabaniYardimcisi.dart';

class otellerDao{
  Future<List<Oteller>> tumOteller() async {
    var db=await VeriTabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>>maps =await db.rawQuery("SELECT * FROM oteller");

    return List.generate(maps.length, (i) {
      var satir=maps[i];

      return Oteller(satir["ad"], satir["adress"], satir["aciklama"], satir["fiyat"], satir["url"]);
    });
  }
}