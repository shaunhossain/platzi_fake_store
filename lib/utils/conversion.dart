import 'dart:convert';

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

  List<dynamic> imageUrl({required String images}){
    final imageJson = jsonDecode(images);
    return imageJson;
  }
}