import 'package:travel_app/database/TarihiYerler.dart';

import '../VeriTabaniYardimcisi.dart';

class tarihiYerlerDao{
  Future<List<TarihiYerler>> tumYerler() async {
    var db=await VeriTabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>>maps =await db.rawQuery("SELECT * FROM tarihiyerler");

    return List.generate(maps.length, (i) {
      var satir=maps[i];

      return TarihiYerler(satir["ad"], satir["aciklama"], satir["aciksaatler"], satir["adress"], satir["url"]);
    });
  }
}