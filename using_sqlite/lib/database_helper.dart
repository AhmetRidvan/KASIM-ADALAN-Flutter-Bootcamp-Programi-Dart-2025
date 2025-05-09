import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static String databaseName = 'person.sqlite';

  static Future<Database> accessToDatabase() async {
    final path = join(
      await getDatabasesPath(),
      databaseName,
    ); // Dosya yolunu oluşturur.

    if (await databaseExists(path)) {
      print("Database already exists");
    } else {
      print('Database is being saved');
      ByteData data = await rootBundle.load(
        'database/$databaseName',
      ); //dosyayı alma
      final bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      ); // 8 bit convert

      await File(path).writeAsBytes(bytes, flush: true); //8 bitliği kaydetme
    }
    return openDatabase(path);
  }
}
