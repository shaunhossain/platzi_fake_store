import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/my_cart/cart_item.dart';
import 'package:platzi_fake_store/view/components/widget/my_cart/custom_my_cart_footer.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          CustomScrollView(physics: const BouncingScrollPhysics(),
              //controller: controller.productController,
              slivers: [
                SliverAppBar(
                  backgroundColor: Colors.white,
                  leading: Center(
                    child: CustomTextView(
                        text: 'My Cart',
                        fontSize: SizeConfig.textScaleFactor! * 24,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  leadingWidth: SizeConfig.width! * 0.5,
                  actions: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search_rounded,
                          color: Colors.black,
                        )),
                  ],
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 12,
                      right: 12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        CartItem(),
                        CartItem(),
                        CartItem(),
                        CartItem(),
                        CartItem(),
                      ],
                    ),
                  ),
                ),
              ]),
          Positioned(
              bottom: 0,
              child: Container(
                  width: SizeConfig.width,
                  height: SizeConfig.height! * 0.1,
                  padding: const EdgeInsets.only(
                      top: 12, left: 30, right: 30, bottom: 12),
                  color: Colors.white,
                  child: CustomMyCartFooter(checkOut: () {}, price: 300)))
        ],
      ),
    ));
  }
}
