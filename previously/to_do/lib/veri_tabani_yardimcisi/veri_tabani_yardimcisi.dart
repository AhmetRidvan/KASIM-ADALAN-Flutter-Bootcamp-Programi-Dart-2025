import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi {
  static final String veritabaniAdi = "todo.db";

  static Future<Database> veritabaniErisim() async {
    String veritabaniYolu = join(
      await getDatabasesPath(),
      veritabaniAdi,
    ); //veri tabanı olunun belirlenmesi

    if (await databaseExists(veritabaniYolu)) {
      print("Veritabanı zaten var.Kopyalamaya gerek yok.");
    } else {
      ByteData data = await rootBundle.load("sql/$veritabaniAdi");
      List<int> bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await File(veritabaniYolu).writeAsBytes(bytes, flush: true);
      print("Veritabanı kopyalandı.");
    }

    return openDatabase(veritabaniYolu);
  }
}
