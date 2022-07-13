import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/db/db_model/add_cart_product.dart';
import 'package:platzi_fake_store/utils/conversion.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/navigator/app_pages.dart';
import 'package:platzi_fake_store/view/components/widget/custom_button.dart';
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
                                          removeProduct(
                                              controller: controller,
                                              item: controller
                                                  .listOfAddCartProduct[index]);
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
                  right: 0,
                  left: 0,
                  child: Container(
                      width: SizeConfig.width,
                      height: SizeConfig.height! * 0.1,
                      padding: const EdgeInsets.only(
                          top: 12, left: 30, right: 30, bottom: 12),
                      color: Colors.white,
                      child: Obx(() {
                        return CustomMyCartFooter(
                            checkOut: () {
                             if(controller.totalPriceOfAddCartProduct.value > 0){
                               Get.toNamed(AppRoutes.checkoutScreen,arguments:  [controller.listOfAddCartProduct,controller.totalPriceOfAddCartProduct.value]);
                             }
                            },
                            price: controller.totalPriceOfAddCartProduct.value);
                      })))
            ],
          ),
        ));
      },
    );
  }

  removeProduct(
      {required AddCartProduct item, required CartController controller}) {
    Get.bottomSheet(
      Container(
        height: 330,
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              width: 36,
              height: 3,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
              child: CustomTextView(
                  text: 'Remove from Cart?',
                  fontSize: SizeConfig.textScaleFactor! * 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const Divider(
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: SizeConfig.width,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    clipBehavior: Clip.antiAlias,
                    color: Colors.grey.shade50,
                    elevation: 0.3,
                    shadowColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      color: Colors.white,
                      height: SizeConfig.width! * 0.26,
                      width: SizeConfig.width! * 0.345,
                      alignment: Alignment.center,
                      child: Image.network(
                        Conversion().imageUrl(images: item.images).first,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: SizeConfig.width! * 0.34,
                            child: CustomTextView(
                                text: item.title,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(item.color)),
                          ),
                          SizedBox(
                            width: SizeConfig.width! * 0.02,
                          ),
                          const CustomTextView(
                              text: 'color',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                          SizedBox(
                            width: SizeConfig.width! * 0.02,
                          ),
                          const CustomTextView(
                              text: '|',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                          SizedBox(
                            width: SizeConfig.width! * 0.02,
                          ),
                          CustomTextView(
                              text: 'size = ${item.size}',
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomTextView(
                              text: '\u0024${item.price}',
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.black),
                          SizedBox(
                            width: SizeConfig.width! * 0.05,
                          ),
                          Container(
                            width: SizeConfig.width! * 0.08,
                            height: SizeConfig.width! * 0.08,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey),
                            child: CustomTextView(
                                text: '${item.quantity}',
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.height! * 0.03,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 150,
                    child: CustomButton(
                        title: 'Cancel',
                        color: Colors.grey.shade100,
                        onPress: () {
                          Get.back();
                        },
                        textColor: Colors.black)),
                SizedBox(
                    width: 150,
                    child: CustomButton(
                        title: 'Yes, Remove',
                        color: Colors.black,
                        onPress: () {
                          controller.removeProductFromAddCart(
                              productId: item.id!);
                          Get.back();
                        },
                        textColor: Colors.white))
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), topRight: Radius.circular(50)),
      ),
    );
  }
}
