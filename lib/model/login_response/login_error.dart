import 'dart:convert';

LoginError loginErrorFromMap(String str) => LoginError.fromMap(jsonDecode(str));

String loginErrorToMap(LoginError data) => json.encode(data.toMap());

class LoginError {
  LoginError({
    required this.statusCode,
    required this.message,
  });

  final int statusCode;
  final String message;

  factory LoginError.fromMap(Map<String, dynamic> json) => LoginError(
    statusCode: json["statusCode"],
    message: json["message"],
  );

  Map<String, dynamic> toMap() => {
    "statusCode": statusCode,
    "message": message,
  };
}
