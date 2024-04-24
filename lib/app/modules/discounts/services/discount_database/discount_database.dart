import 'package:sqflite/sqflite.dart';
import 'package:valevantagens/app/modules/discounts/models/discount_item_model.dart';
import 'package:valevantagens/app/modules/discounts/services/database_service.dart';
import 'package:valevantagens/app/modules/discounts/services/discount_database/i_discount_database.dart';

class DiscountDatabase implements IDiscountDatabase {
  final DatabaseService _databaseService;
  DiscountDatabase({
    required DatabaseService databaseService,
  }) : _databaseService = databaseService;

  final String tableName = 'discountItem';

  @override
  Future<void> createTable(Database database) async {
    await database.execute('''
      CREATE TABLE IF NOT EXISTS $tableName (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        isActive INTEGER,
        discountName TEXT,
        description TEXT,
        discountType TEXT,
        priceOf REAL,
        priceBy REAL,
        resultPrecification REAL,
        pricePercentage REAL,
        percentage INTEGER,
        resultPercentage REAL,
        light INTEGER,
        payment INTEGER,
        priceLightPayment REAL,
        dateActivation TEXT,
        dateInactivation TEXT,
        image TEXT
      );
    ''');
  }

  @override
  Future<void> insert(Map<String, dynamic> data) async {
    final database = await _databaseService.database;
    await database.insert(tableName, data);
  }

  @override
  Future<void> update(Map<String, dynamic> data) async {
    final database = await _databaseService.database;
    await database.update(
      tableName,
      data,
      where: 'id = ?',
      conflictAlgorithm: ConflictAlgorithm.rollback,
      whereArgs: [data['id']],
    );
  }

  @override
  Future<void> delete(int id) async {
    final database = await _databaseService.database;
    await database.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<void> deleteAll() async {
    final database = await _databaseService.database;
    await database.delete(tableName);
  }

  @override
  Future<List<Map<String, dynamic>>> getData() async {
    final database = await _databaseService.database;
    return database.query(tableName);
  }

  @override
  Future<List<DiscountItemModel>> fetchAll() async {
    final List<Map<String, dynamic>> discounts = await getData();
    return discounts
        .map((discount) => DiscountItemModel.fromSqlfiteDatabase(discount))
        .toList();
  }
}
