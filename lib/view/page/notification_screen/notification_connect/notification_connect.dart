import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:platzi_fake_store/utils/endpoint.dart';


abstract class NotificationProvider {
  Future<dynamic> getAllProductCategory();
  Future<dynamic> getAllProducts();
}

class INotificationProvider extends GetConnect implements NotificationProvider {

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
  Future getAllProducts() async {
    final response = await http.get(
      Uri.parse(baseUrl+allProductEndpoint),
    );
    if (response.statusCode == 200) {
      log(response.body);
      return response.body;
    } else {
      return response.body;
    }
  }
}
