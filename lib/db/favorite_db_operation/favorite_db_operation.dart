import 'dart:developer';

import 'package:platzi_fake_store/db/database_helper.dart';
import 'package:platzi_fake_store/model/product/product_item.dart';

class FavoriteDbOperation{
  FavoriteDbOperation._privateConstructor();

  static final FavoriteDbOperation instance =  FavoriteDbOperation._privateConstructor();

Future<List<ProductItem>> getProductsList({required int status}) async {
  final db = await DatabaseHelper.instance.database;
  var products = await db.query('favoriteTable');
  List<ProductItem> productsList = products.isNotEmpty
      ? products.map((c)=> ProductItem.fromJson(c)).toList()
      : [];
  return productsList;
}

Future <int> add(ProductItem productItem) async {
  final db = await DatabaseHelper.instance.database;
  return await db.insert('favoriteTable',productItem.toJson());
}

Future<int> remove(int id) async {
  final db = await DatabaseHelper.instance.database;
  return await db.delete('favoriteTable',where: 'id = ?', whereArgs: [id]);
}

Future<int> update(ProductItem productItem) async{
  log('update called');
  final db = await DatabaseHelper.instance.database;
  return db.update('favoriteTable',productItem.toJson(),where: 'id =?',whereArgs: [productItem.id]);
}

Future<ProductItem?> getSingleProduct(int id) async{
  final db = await DatabaseHelper.instance.database;
  List<Map> maps = await db.query('favoriteTable',
      where: 'id = ?',
      whereArgs: [id]);
  if (maps.length > 0) {
    return ProductItem.fromJson(maps.first);
  }
  return null;
}
}