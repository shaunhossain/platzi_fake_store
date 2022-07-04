import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:platzi_fake_store/utils/endpoint.dart';


abstract class SpecialOfferProvider {
  Future<dynamic> getSomeProducts();
}

class ISpecialOfferProvider extends GetConnect implements SpecialOfferProvider {

  @override
  Future getSomeProducts() async {
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
