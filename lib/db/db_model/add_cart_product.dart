class AddCartProduct{
  AddCartProduct({
    this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.images,
    required this.color,
    required this.size,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String title;
  final int price;
  final String description;
  final String category;
  final String images;
  final int color;
  final String size;
  final int quantity;
  final String createdAt;
  final String updatedAt;

  factory AddCartProduct.fromJson(Map<dynamic, dynamic> json) => AddCartProduct(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    category: json["category"],
    images: json["images"],
    color: json["color"],
    size: json["size"],
    quantity: json["quantity"],
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
    "color": color,
    "size": size,
    "quantity": quantity,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}