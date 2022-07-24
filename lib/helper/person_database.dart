import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const String _databaseName = "kisileruygulamasi.sqlite";
  static Future<Database> dataBaseConnect() async {
    String dataBaseRoute = join(await getDatabasesPath(), _databaseName);

    if (await databaseExists(dataBaseRoute)) {
    } else {
      ByteData data = await rootBundle.load("assets/database/$_databaseName");

      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(_databaseName).writeAsBytes(bytes, flush: true);
    }
    return openDatabase(dataBaseRoute);
  }
}
