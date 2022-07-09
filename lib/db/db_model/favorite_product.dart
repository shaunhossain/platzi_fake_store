class FavoriteProduct{
  FavoriteProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String title;
  final int price;
  final String description;
  final String category;
  final String images;
  final String createdAt;
  final String updatedAt;

  factory FavoriteProduct.fromJson(Map<dynamic, dynamic> json) => FavoriteProduct(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    category: json["category"],
    images: json["images"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "images": images,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}