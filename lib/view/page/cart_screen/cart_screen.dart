import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_empty_page.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/my_cart/cart_item.dart';
import 'package:platzi_fake_store/view/components/widget/my_cart/custom_my_cart_footer.dart';
import 'package:platzi_fake_store/view/page/cart_screen/cart_controller/cart_controller.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<CartController>(
      builder: (controller) {
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
                    Obx(() {
                      return controller.listOfAddCartProduct.value.isEmpty
                          ? const SliverToBoxAdapter(
                              child: CustomEmptyPage(
                                  asset: 'assets/empty_cart.png',
                                  warningTitle:
                                      'You don\'t add any product yet',
                                  warningDes:
                                      'You need to add product to your add cart to order'),
                            )
                          : SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  return Container(
                                      height: SizeConfig.height! * 0.20,
                                      margin: const EdgeInsets.all(12),
                                      child: CartItem(
                                        item: controller
                                            .listOfAddCartProduct[index],
                                        deleteItem: () {
                                          controller.removeProductFromAddCart(
                                              productId: controller
                                                  .listOfAddCartProduct[index]
                                                  .id!);
                                        },
                                      ));
                                },
                                childCount:
                                    controller.listOfAddCartProduct.length,
                              ),
                            );
                    }),
                    const SliverToBoxAdapter(
                      child: SizedBox(
                        height: 80,
                      ),
                    )
                  ]),
              Positioned(
                  bottom: 0,
                  child: Container(
                      width: SizeConfig.width,
                      height: SizeConfig.height! * 0.1,
                      padding: const EdgeInsets.only(
                          top: 12, left: 30, right: 30, bottom: 12),
                      color: Colors.white,
                      child: Obx(() {
                        return CustomMyCartFooter(
                            checkOut: () {},
                            price: controller.totalPriceOfAddCartProduct.value);
                      })))
            ],
          ),
        ));
      },
    );
  }
}
