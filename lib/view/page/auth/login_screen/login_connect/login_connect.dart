import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;


abstract class LoginProvider {
  Future<dynamic> sendUserLoginRequest({required String email, required String password});
}

class ILoginProvider extends GetConnect implements LoginProvider {

  @override
  Future sendUserLoginRequest({required String email, required String password}) async {
    Map<String, String> jsonBody = {
      "email" : email,
      "password" : password
    };
    log(jsonBody.toString());
    final response = await http.post(
      Uri.parse(''),
      body: jsonBody,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      return response.body;
    }
  }
}
