import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/db/cart_db_operation/cart_db_operation.dart';
import 'package:platzi_fake_store/db/db_model/add_cart_product.dart';

class CartController extends GetxController {
  var listOfAddCartProduct = <AddCartProduct>[].obs;
  var totalPriceOfAddCartProduct = 0.obs;
  ScrollController addCartListController = ScrollController();

  @override
  Future<void> onInit() async {
    super.onInit();
    getAllCartData();
  }

  /// get all Habits
  void getAllCartData() async {
    listOfAddCartProduct.value =
    await CartDbOperation.instance.getAddCartProductsList();
    _getTotalPrice(listOfAddCartProduct);
  }

  _getTotalPrice(List<AddCartProduct> allProduct){
    int totalPrice = 0;
    for (var item in allProduct) {
      totalPrice = totalPrice + item.price;
    }
    totalPriceOfAddCartProduct.value = totalPrice;
  }

  void removeProductFromAddCart({required int productId}) async {
    await CartDbOperation.instance.remove(productId);
    getAllCartData();
  }
}