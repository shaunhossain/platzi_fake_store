import 'dart:convert';

List<ItemCategory> itemCategoryFromMap(String str) => List<ItemCategory>.from(jsonDecode(str).map((x) => ItemCategory.fromMap(x)));

String itemCategoryToMap(List<ItemCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class ItemCategory {
  ItemCategory({
    required this.id,
    required this.name,
    required this.image,
  });

  final int id;
  final String name;
  final String image;

  factory ItemCategory.fromMap(Map<String, dynamic> json) => ItemCategory(
    id: json["id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
    "image": image,
  };
}
