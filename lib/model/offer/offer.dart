import 'package:platzi_fake_store/model/product/product_item.dart';

class Offer{
  Offer({required this.offerMassage, required this.item,required this.offerPercentage});
  final String offerPercentage;
  final String offerMassage;
  final ProductItem item;
}