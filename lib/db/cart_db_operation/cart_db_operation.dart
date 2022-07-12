import 'dart:developer';
import 'package:platzi_fake_store/db/database_helper.dart';
import 'package:platzi_fake_store/db/db_model/add_cart_product.dart';

class CartDbOperation{
  CartDbOperation._privateConstructor();

  static final CartDbOperation instance =  CartDbOperation._privateConstructor();
  Future<List<AddCartProduct>> getAddCartProductsList() async {
    final db = await DatabaseHelper.instance.database;
    var products = await db.query('cartTable');
    List<AddCartProduct> productsList = products.isNotEmpty
        ? products.map((c)=> AddCartProduct.fromJson(c)).toList()
        : [];
    return productsList;
  }

  Future <int> addCart(AddCartProduct addCartProductItem) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('cartTable',addCartProductItem.toJson());
  }

  Future<int> remove(int id) async {
    final db = await DatabaseHelper.instance.database;
    return await db.delete('cartTable',where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(AddCartProduct addCartProductItem) async{
    log('update called');
    final db = await DatabaseHelper.instance.database;
    return db.update('cartTable',addCartProductItem.toJson(),where: 'id =?',whereArgs: [addCartProductItem.id]);
  }

  Future<AddCartProduct?> getSingleAddCartProduct(int id) async{
    final db = await DatabaseHelper.instance.database;
    List<Map> maps = await db.query('cartTable',
        where: 'id = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return AddCartProduct.fromJson(maps.first);
    }
    return null;
  }
}