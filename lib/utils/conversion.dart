import 'dart:convert';

import 'package:platzi_fake_store/model/product/product_category.dart';

class Conversion{
  String selectIcon({required String name}){
    switch(name){
      case 'Clothes' :
        return 'assets/clothes.svg';
      case 'Electronics' :
        return 'assets/electronics.svg';
      case 'Furniture' :
        return 'assets/furniture.svg';
      case 'Shoes' :
        return 'assets/shoes.svg';
      case 'Others' :
        return 'assets/more.svg';
    }
    return 'assets/more.svg';
  }

  List<String> imageUrl({required String images}){
    final imageJson = jsonDecode(images);
    List<String> imageList = [];
    imageJson.forEach((item){
      imageList.add(item);
    });
    return imageList;
  }

  ProductCategory categoryString({required String category}){
    final categoryJson = jsonDecode(category);
   final convertedCategory = ProductCategory.fromJson(categoryJson);
    return convertedCategory;
  }
}