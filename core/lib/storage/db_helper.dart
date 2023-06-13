import 'dart:async';
import 'dart:io';

import 'package:core/storage/entities/cart_item_entity.dart';
import 'package:core/storage/entities/variant_entity.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'entities/option_entity.dart';
import 'entities/order_entity.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();

  factory DatabaseHelper() => _instance;

  static Database? _db;

  static const _ordersTable = 'ORDERS_TABLE';
  static const _itemsTable = 'ITEMS_TABLE';
  static const _variantsTable = 'VARIANTS_TABLE';
  static const _timeSlotsTable = 'TIME_TABLE';
  static const _optionsTable = 'OPTIONS_TABLE';

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  DatabaseHelper.internal();

  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "smart1.db");
    var theDb = await openDatabase(path, version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return theDb;
  }

  void _onCreate(Database db, int version) async {
    // When creating the db, create the table
    await db.execute(
      '''
          CREATE TABLE $_ordersTable( 
              id TEXT PRIMARY KEY NOT NULL, 
              note TEXT,
              image TEXT,
              order_type TEXT,
              name TEXT)
        ''',
    );
    await db.execute(
      '''
          CREATE TABLE $_itemsTable( 
              id TEXT PRIMARY KEY NOT NULL, 
              name TEXT,
              image TEXT,
              count INTEGER,
              price TEXT,
              shipping_fees INTEGER,
              date TEXT,
              time_slot TEXT,
              hasCount INTEGER,
              note TEXT)
        ''',
    );
    await db.execute(
      '''
          CREATE TABLE $_variantsTable(  
              id TEXT PRIMARY KEY NOT NULL,
              name TEXT,
              item_id TEXT,
              FOREIGN KEY (item_id) REFERENCES $_itemsTable(id) ON DELETE CASCADE)
        ''',
    );
    await db.execute(
      '''
          CREATE TABLE $_timeSlotsTable(  
              id TEXT PRIMARY KEY NOT NULL,
              name TEXT,
              item_id TEXT,
              FOREIGN KEY (item_id) REFERENCES $_itemsTable(id) ON DELETE CASCADE)
        ''',
    );
    await db.execute(
      '''
          CREATE TABLE $_optionsTable(  
              id TEXT PRIMARY KEY NOT NULL,
              name TEXT,
              price TEXT,
              variants_id TEXT,
              FOREIGN KEY (variants_id) REFERENCES $_variantsTable(id) ON DELETE CASCADE)
        ''',
    );
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) {
    if (oldVersion < newVersion) {}
  }

  Future<int> addOrder({required OrderEntity orderEntity}) async {
    var dbOrder = await db;
    int res = await dbOrder.insert(_ordersTable, orderEntity.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  void updateOrder({required String note, required String id}) async {
    var dbOrder = await db;
    await dbOrder.update(
      _ordersTable,
      {'note': note},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> addItem({required CartItemEntity itemEntity}) async {
    var dbItem = await db;
    int res = await dbItem.insert(_itemsTable, itemEntity.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Future<List<CartItemEntity>> updateItemCount({required int count, required String itemId}) async {
    var dbItem = await db;
    int res = await dbItem.rawUpdate('UPDATE $_itemsTable SET count = ? WHERE id = ?', [count, itemId]);
    var result = await dbItem.query(_itemsTable);
    return result.map((e) => CartItemEntity.fromJson(e)).toList();
  }

  Future<int> addVariant({required VariantEntity variantEntity}) async {
    var dbVariant = await db;
    int res = await dbVariant.insert(_variantsTable, variantEntity.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }
  Future<int> addTime({required TimeSlotsEntity timeSlotsEntity}) async {
    var dbVariant = await db;
    int res = await dbVariant.insert(_timeSlotsTable, timeSlotsEntity.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Future<int> addOption({required OptionEntity optionEntity}) async {
    var dbOption = await db;
    int res = await dbOption.insert(_optionsTable, optionEntity.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }

  Future<OrderEntity> getOrder() async {
    var dbOrder = await db;
    var result = await dbOrder.query(_ordersTable);
    if (result.isNotEmpty) {
      return OrderEntity.fromJson(result.first);
    } else {
      return OrderEntity();
    }
  }

  Future<List<CartItemEntity>> getAllItems() async {
    var dbItem = await db;
    var result = await dbItem.query(_itemsTable);
    return result.map((e) => CartItemEntity.fromJson(e)).toList();
  }

  Future<List<VariantEntity>> getAllVariants(String itemId) async {
    var dbVariant = await db;
    var result = await dbVariant.query(_variantsTable, where: "item_id LIKE ?", whereArgs: ['%$itemId']);
    // var result = await dbVariant.query(_variantsTable);
    return result.map((e) => VariantEntity.fromJson(e)).toList();
  }
  Future<List<TimeSlotsEntity>> getAllTimesSlots(String itemId) async {
    var dbVariant = await db;
    var result = await dbVariant.query(_timeSlotsTable, where: "item_id LIKE ?", whereArgs: ['%$itemId']);
    // var result = await dbVariant.query(_variantsTable);
    return result.map((e) => TimeSlotsEntity.fromJson(e)).toList();
  }

  Future<List<OptionEntity>> getAllOptions(String variantId) async {
    var dbOption = await db;
    var result = await dbOption.query(_optionsTable, where: "variants_id LIKE ?", whereArgs: ['%$variantId']);
    return result.map((e) => OptionEntity.fromJson(e)).toList();
  }

  Future<int> deleteItem(String itemId) async {
    var dbItems = await db;
    int deleteItem = await dbItems.delete(_itemsTable, where: "id = ?", whereArgs: [itemId]);
    deleteVariant(itemId);
    deleteTimeSlots(itemId);
    return deleteItem;
  }

  Future<int> deleteVariant(String itemId) async {
    var dbVariant = await db;
    var result = await dbVariant.query(_variantsTable, where: "item_id LIKE ?", whereArgs: ['%$itemId']);
    List<VariantEntity> variants = result.map((e) => VariantEntity.fromJson(e)).toList();
    for (var variant in variants) {
        await dbVariant.delete(
          _optionsTable,
          where: 'variants_id = ?',
          whereArgs: [variant.id],
        );
    }

    int deleteVariant = await dbVariant.delete(_variantsTable, where: "item_id = ?", whereArgs: [itemId]);
    return deleteVariant;
  }
  Future<int> deleteTimeSlots(String itemId) async {
    var dbVariant = await db;
    var result = await dbVariant.query(_timeSlotsTable, where: "item_id LIKE ?", whereArgs: ['%$itemId']);


    int deleteTime = await dbVariant.delete(_timeSlotsTable, where: "item_id = ?", whereArgs: [itemId]);
    return deleteTime;
  }

  Future close() async {
    var dbProjects = await db;
    return dbProjects.close();
  }

  Future clear() async {
    var d = await db;
    d.rawDelete("DELETE FROM $_ordersTable");
    d.rawDelete("DELETE FROM $_itemsTable");
    d.rawDelete("DELETE FROM $_variantsTable");
    d.rawDelete("DELETE FROM $_timeSlotsTable");
    d.rawDelete("DELETE FROM $_optionsTable");
  }
}
