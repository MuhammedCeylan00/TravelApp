import 'package:travel_app/database/IbadetYeri.dart';

import '../VeriTabaniYardimcisi.dart';

class ibadetYeriDao{
  Future<List<IbadetYeri>> tumIbadetYerleri() async {
    var db=await VeriTabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>>maps =await db.rawQuery("SELECT * FROM ibadetyerleri");

    return List.generate(maps.length, (i) {
      var satir=maps[i];

      return IbadetYeri(satir["ad"], satir["adress"], satir["aciklama"], satir["url"]);
    });
  }
}