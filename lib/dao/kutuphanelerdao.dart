import 'package:travel_app/database/Kutuphaneler.dart';

import '../VeriTabaniYardimcisi.dart';

class kutuphaneDao{
  Future<List<Kutuphaneler>> kutuphaneleriGoster() async {
    var db=await VeriTabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>>maps =await db.rawQuery("SELECT * FROM kutuphane");

    return List.generate(maps.length, (i) {
      var satir=maps[i];

      return Kutuphaneler(satir["ad"], satir["aciklama"], "Van Merkez",satir["aciksaatler"],satir["url"]);
    });
  }
}