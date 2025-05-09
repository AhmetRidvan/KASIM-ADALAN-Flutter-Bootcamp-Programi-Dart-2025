import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {//işlevlerini anlaman yeterli
  static final fileName = 'flagquiz.sqlite';

  static Future<Database> AccessToDatabase() async {
    String databasePath = join(await getDatabasesPath(), fileName);

    if (await databaseExists(databasePath)) {
      print('File already here');
    } else {
      final data = await rootBundle.load('database/$fileName');
      final bytes = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
 
      await File(databasePath).writeAsBytes(bytes, flush: true);
      print('Veri tabanı kopyalandı');
    }

    return openDatabase(databasePath);
  }
}
