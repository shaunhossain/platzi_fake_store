import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:platzi_fake_store/utils/endpoint.dart';


abstract class ViewSingleCategoryProvider {
  Future<dynamic> getAllProductOfCategory({required String categoryId, required int offset});
}

class IViewSingleCategoryProvider extends GetConnect implements ViewSingleCategoryProvider {

  @override
  Future getAllProductOfCategory({required String categoryId, required int offset}) async {

    final response = await http.get(
      Uri.parse(baseUrl+singleCategoryProductsEndpoint+categoryId+allProductEndpoint+offset.toString()+allProductEndpointSuffix),
    );
    if (response.statusCode == 200) {
      log(response.body);
      return response.body;
    } else {
      return response.body;
    }
  }
}
