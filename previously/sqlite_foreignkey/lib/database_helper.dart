import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class DatabaseHelper {
  static String _databaseFileName = 'filmler.sqlite';

  static Future<Database> databaseHelper() async {
    String path = join(await getDatabasesPath(), _databaseFileName);
    if (await databaseExists(path)) {
      print('Database already exists');
    } else {
      final data = await rootBundle.load('database/${_databaseFileName}');
      final byte = data.buffer.asUint8List(
        data.offsetInBytes,
        data.lengthInBytes,
      );
      await File(path).writeAsBytes(byte, flush: true);
      print('The database has been copied');
    }

    return openDatabase(path);
  }
}
