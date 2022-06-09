import 'package:travel_app/VeriTabaniYardimcisi.dart';
import 'package:travel_app/database/Parklar.dart';

import '../database/Kullanici.dart';

class Kullanicidao{
  Future<List<Kullanici>> tumKullanicilar() async {
    var db=await VeriTabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>>maps =await db.rawQuery("SELECT * FROM kullanici");

    return List.generate(maps.length, (i) {
      var satir=maps[i];

      return Kullanici(satir["id"], satir["ad"], satir["soyad"], satir["eposta"], satir["sifre"]);
    });
  }

  Future<void> kullaniciEkle(String ad, String soyad,String eposta,String sifre) async {
    print("kayıt yapılıyor");
    var db=await VeriTabaniYardimcisi.veritabaniErisim();
    var bilgiler=Map<String,dynamic>();
    bilgiler["ad"]=ad;
    bilgiler["soyad"]=soyad;
    bilgiler["eposta"]=eposta;
    bilgiler["sifre"]=sifre;

    await db.insert("kullanici", bilgiler);
  }



}