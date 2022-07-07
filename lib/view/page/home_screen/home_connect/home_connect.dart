import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:platzi_fake_store/utils/endpoint.dart';


abstract class HomeProvider {
  Future<dynamic> getAllProductCategory();
  Future<dynamic> getSomeProducts();
  Future<dynamic> getAllProducts({required int offset});
}

class IHomeProvider extends GetConnect implements HomeProvider {

  @override
  Future getAllProductCategory() async {

    final response = await http.get(
      Uri.parse(baseUrl+allCategoryEndpoint),
    );
    if (response.statusCode == 200) {
      log(response.body);
      return response.body;
    } else {
      return response.body;
    }
  }

  @override
  Future getSomeProducts() async {
    final response = await http.get(
      Uri.parse(baseUrl+someLimitedProducts),
    );
    if (response.statusCode == 200) {
      log(response.body);
      return response.body;
    } else {
      return response.body;
    }
  }

  @override
  Future getAllProducts({required int offset}) async {
    log('offset number -> $offset');
    final response = await http.get(
      Uri.parse(baseUrl+allProductEndpoint+offset.toString()+allProductEndpointSuffix),
    );
    if (response.statusCode == 200) {
      log(response.body);
      return response.body;
    } else {
      return response.body;
    }
  }
}
