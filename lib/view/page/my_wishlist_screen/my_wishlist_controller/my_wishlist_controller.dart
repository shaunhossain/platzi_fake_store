import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/db/db_model/favorite_product.dart';
import 'package:platzi_fake_store/db/favorite_db_operation/favorite_db_operation.dart';

class MyWishlistController extends GetxController {
  var listOfCompleteHabitFromLocal = <FavoriteProduct>[].obs;
  ScrollController orderProductListController = ScrollController();
  @override
  Future<void> onInit() async {
    super.onInit();
    _getAllHabitsData();
  }

  /// get all Habits
  void _getAllHabitsData() async {
    listOfCompleteHabitFromLocal.value =
    await FavoriteDbOperation.instance.getProductsList();
  }
}