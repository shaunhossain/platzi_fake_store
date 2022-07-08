import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.role,
    required this.avatar,
  });

  final int id;
  final String email;
  final String password;
  final String name;
  final String role;
  final String avatar;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"] == null ? null : json["id"],
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
    name: json["name"] == null ? null : json["name"],
    role: json["role"] == null ? null : json["role"],
    avatar: json["avatar"] == null ? null : json["avatar"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "email": email == null ? null : email,
    "password": password == null ? null : password,
    "name": name == null ? null : name,
    "role": role == null ? null : role,
    "avatar": avatar == null ? null : avatar,
  };
}
