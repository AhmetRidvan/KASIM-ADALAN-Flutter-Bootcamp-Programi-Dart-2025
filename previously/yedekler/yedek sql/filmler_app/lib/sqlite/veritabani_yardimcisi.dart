import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi {
  static final String veritabaniAdi = "filmler_app.sqlite";

  static Future<Database> veritabaniErisim() async {
    String veritabaniYolu = join(
      await getDatabasesPath(),
      veritabaniAdi,
    ); //veri tabanı olunun belirlenmesi

    if (await databaseExists(veritabaniYolu)) {
      print("Veritabanı zaten var.Kopyalamaya gerek yok.");
    } else {
      ByteData data = await rootBundle.load("Database/$veritabaniAdi"); // assets klasöründen dosyayı bytle olarak alır.
      List<int> bytes = data.buffer.asUint8List( // bu byte versini 8 bitlik tamsayılar listesine dönüştürür
        data.offsetInBytes, //başlanıç
        data.lengthInBytes, //uzunluk
      );
      await File(veritabaniYolu).writeAsBytes(flush: true,bytes); // cihazın yerel depolamasında belirtilen yolda bir dosya oluşturur.
      print("Veritabanı kopyalandı.");
    }

    return openDatabase(veritabaniYolu); //veri tabanını açar
  }
}
