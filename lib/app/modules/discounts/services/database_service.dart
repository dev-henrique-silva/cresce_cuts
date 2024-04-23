import 'package:flutter_modular/flutter_modular.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:valevantagens/app/modules/discounts/services/discount_database/discount_database.dart';

class DatabaseService {
  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initialize();
    return _database!;
  }

  Future<String> get fullPath async {
    const name = 'database.db';
    final path = await getDatabasesPath();
    return join(path, name);
  }

  Future<Database> _initialize() async {
    final path = await fullPath;
    return openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true,
    );
  }

  Future<void> create(Database database, int version) async {
    await DiscountDatabase(
      databaseService: Modular.get(),
    ).createTable(database);
  }
}
