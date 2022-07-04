import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:platzi_fake_store/model/product/product_item.dart';
import 'package:platzi_fake_store/utils/network_type/connection_type.dart';
import 'package:platzi_fake_store/view/services/initial_controller/initial_controller.dart';

import '../view_single_category_connect/view_single_category_connect.dart';

class ViewSingleCategoryController extends GetxController {
  final RxString dataFetchingError = ''.obs;
  final allProductOfCategory = <ProductItem>[].obs;

  final IViewSingleCategoryProvider _singleCategoryProvider = IViewSingleCategoryProvider();
  final InitialController _controller = Get.find<InitialController>();

  void getAllProductsOfCategory({required int categoryId}){
    if(_controller.connectionType.value == ConnectionType.mobile || _controller.connectionType.value == ConnectionType.wifi){
      try {
        _singleCategoryProvider.getAllProductOfCategory(categoryId: categoryId).then((value){
          try {
            final List<ProductItem> response = productItemFromJson(value);
            for (var value in response) {
              allProductOfCategory.add(value);
            }
            log("products ->>>>> ${response.first.category.toString()}");
          } on Exception catch (e) {
            dataFetchingError.value ="$e";
          }
        }, onError: (error){
          dataFetchingError.value ="$error";
        });
      } on SocketException {
        dataFetchingError.value ="No internet connection";
      }
    } else{
      dataFetchingError.value ="No internet connection";
    }
  }
}