import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:platzi_fake_store/utils/endpoint.dart';


abstract class ProfileProvider {
  Future<dynamic> getUserProfileInfo({required String token});
}

class IProfileProvider extends GetConnect implements ProfileProvider {

  @override
  Future getUserProfileInfo({required String token}) async {

    final response = await http.get(
      Uri.parse(baseUrl+ profileEndpoint),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        }
    );
    if (response.statusCode == 200) {
      log(response.body);
      return response.body;
    } else {
      return response.body;
    }
  }
}
