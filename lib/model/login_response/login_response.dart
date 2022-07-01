import 'dart:convert';

LoginResponse loginResponseFromMap(String str) => LoginResponse.fromMap(jsonDecode(str));

String loginResponseToMap(LoginResponse data) => json.encode(data.toMap());

class LoginResponse {
  LoginResponse({
    required this.accessToken,
  });

  final String accessToken;

  factory LoginResponse.fromMap(Map<String, dynamic> json) => LoginResponse(
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toMap() => {
    "access_token": accessToken,
  };
}
