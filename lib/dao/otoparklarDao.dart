import 'package:travel_app/database/Otoparklar.dart';

import '../VeriTabaniYardimcisi.dart';

class otoparklarDao{
  Future<List<Otoparklar>> tumOtoparklar() async {
    var db=await VeriTabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>>maps =await db.rawQuery("SELECT * FROM otoparklar");

    return List.generate(maps.length, (i) {
      var satir=maps[i];

      return Otoparklar(satir["ad"], satir["adress"], satir["aciksaatlar"], "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkcH2MjVbnDJxtItQJ-EkTPxxJy41i_2G6Eg&usqp=CAU",satir["fiyat"]);
    });
  }
}