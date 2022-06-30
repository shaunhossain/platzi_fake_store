import 'dart:convert';

SignUpResponse signUpResponseFromJson(String str) => SignUpResponse.fromJson(jsonDecode(str));

String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());

class SignUpResponse {
  SignUpResponse({
    required this.name,
    required this.email,
    required this.avatar,
    required this.password,
    required this.id,
    required this.role,
  });

  final String name;
  final String email;
  final String avatar;
  final String password;
  final int id;
  final String role;

  factory SignUpResponse.fromJson(Map<String, dynamic> json) => SignUpResponse(
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    avatar: json["avatar"] == null ? null : json["avatar"],
    password: json["password"] == null ? null : json["password"],
    id: json["id"] == null ? null : json["id"],
    role: json["role"] == null ? null : json["role"],
  );

  Map<String, dynamic> toJson() => {
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "avatar": avatar == null ? null : avatar,
    "password": password == null ? null : password,
    "id": id == null ? null : id,
    "role": role == null ? null : role,
  };
}
