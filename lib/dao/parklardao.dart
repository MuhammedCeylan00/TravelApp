import '../VeriTabaniYardimcisi.dart';
import '../database/Parklar.dart';

class parklardao{
  Future<List<Parklar>> tumParklar() async {
    var db=await VeriTabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>>maps =await db.rawQuery("SELECT * FROM parklar");

    return List.generate(maps.length, (i) {
      var satir=maps[i];

      return Parklar(satir["id"],satir["ad"], satir["adress"], satir["url"]);
    });
  }
}