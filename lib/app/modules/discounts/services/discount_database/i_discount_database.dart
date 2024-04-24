import 'package:sqflite/sqflite.dart';
import 'package:valevantagens/app/modules/discounts/models/discount_item_model.dart';

abstract class IDiscountDatabase {
  Future<void> createTable(Database database);
  Future<void> insert(Map<String, dynamic> data);
  Future<void> update(Map<String, dynamic> data);
  Future<DiscountItemModel> fetchById(int id);
  Future<void> delete(int id);
  Future<void> deleteAll();
  Future<List<Map<String, dynamic>>> getData();
  Future<List<DiscountItemModel>> fetchAll();
}
