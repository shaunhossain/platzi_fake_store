import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:platzi_fake_store/utils/endpoint.dart';


abstract class RegistrationProvider {
  Future<dynamic> sendUserRegistrationRequest({required String name,required String email, required String password});
}

class IRegistrationProvider extends GetConnect implements RegistrationProvider {

  @override
  Future sendUserRegistrationRequest({required String name,required String email, required String password}) async {
    Map<String, String> jsonBody = {
      "name" : name,
      "email" : email,
      "avatar": "image.jpg",
      "password" : password
    };

    log(jsonBody.toString());
    final response = await http.post(
      Uri.parse(baseUrl + signUpEndpoint),
      body: jsonBody,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }
}
