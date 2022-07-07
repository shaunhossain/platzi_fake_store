import 'dart:convert';

import 'package:platzi_fake_store/model/product/product_category.dart';

List<ProductItem> productItemFromJson(String str) => List<ProductItem>.from(jsonDecode(str).map((x) => ProductItem.fromJson(x)));

String productItemToJson(List<ProductItem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductItem {
  ProductItem({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
  });

  final int id;
  final String title;
  final int price;
  final String description;
  final ProductCategory? category;
  final List<String>? images;

  factory ProductItem.fromJson(Map<dynamic , dynamic> json) => ProductItem(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    price: json["price"] == null ? null : json["price"],
    description: json["description"] == null ? null : json["description"],
    category: json["category"] == null ? null : ProductCategory.fromJson(json["category"]),
    images: json["images"] == null ? null : List<String>.from(json["images"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "price": price == null ? null : price,
    "description": description == null ? null : description,
    "category": category == null ? null : category!.toJson(),
    "images": images == null ? null : List<dynamic>.from(images!.map((x) => x)),
  };
}
