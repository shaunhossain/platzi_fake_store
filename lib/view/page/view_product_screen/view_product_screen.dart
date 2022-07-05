import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/model/product/product_item.dart';

class ViewProductScreen extends StatelessWidget {
  ViewProductScreen({Key? key}) : super(key: key);
  final ProductItem item = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Center(
            child: Text("${item.title}"),
          ),
        ));
  }
}
