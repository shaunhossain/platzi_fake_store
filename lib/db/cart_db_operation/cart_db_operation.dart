import 'dart:developer';

import 'package:platzi_fake_store/db/database_helper.dart';
import 'package:platzi_fake_store/model/product/product_item.dart';

class CartDbOperation{
  CartDbOperation._privateConstructor();

  static final CartDbOperation instance =  CartDbOperation._privateConstructor();
  Future<List<ProductItem>> getAddCartProductsList({required int status}) async {
    final db = await DatabaseHelper.instance.database;
    var products = await db.query('cartTable');
    List<ProductItem> productsList = products.isNotEmpty
        ? products.map((c)=> ProductItem.fromJson(c)).toList()
        : [];
    return productsList;
  }

  Future <int> addCart(ProductItem productItem) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('cartTable',productItem.toJson());
  }

  Future<int> remove(int id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete('cartTable',where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(ProductItem productItem) async{
    log('update called');
    final db = await DatabaseHelper.instance.database;
    return db.update('cartTable',productItem.toJson(),where: 'id =?',whereArgs: [productItem.id]);
  }

  Future<ProductItem?> getSingleAddCartProduct(int id) async{
    final db = await DatabaseHelper.instance.database;
    List<Map> maps = await db.query('cartTable',
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return ProductItem.fromJson(maps.first);
    }
    return null;
  }
}