import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/checkout/custom_bill_board.dart';
import 'package:platzi_fake_store/view/components/widget/checkout/custom_location_button.dart';
import 'package:platzi_fake_store/view/components/widget/checkout/custom_product_view.dart';
import 'package:platzi_fake_store/view/components/widget/checkout/custom_shipping_type_button.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/page/checkout_screen/checkout_controller/checkout_controller.dart';

import '../../components/widget/my_cart/custom_check_out_button.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  dynamic get item => Get.arguments;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<CheckoutController>(
      builder: (controller) {
        return SafeArea(
            child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            title: CustomTextView(
                text: 'Checkout',
                fontSize: SizeConfig.textScaleFactor! * 24,
                fontWeight: FontWeight.w500,
                color: Colors.black),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz_rounded,
                    color: Colors.black,
                  )),
            ],
            backgroundColor: Colors.white,
            bottomOpacity: 0.0,
            elevation: 0.3,
          ),
          body: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Stack(
              children: [
                CustomScrollView(physics: const BouncingScrollPhysics(),
                    //controller: controller.productController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomTextView(
                                text: 'Shipping Address',
                                fontSize: SizeConfig.textScaleFactor! * 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomLocationButton(
                                title: 'Home',
                                address: controller.shippingAddress,
                                onTap: () {}),
                            const SizedBox(
                              height: 24,
                            ),
                            const Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            CustomTextView(
                                text: 'Order List',
                                fontSize: SizeConfig.textScaleFactor! * 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            const SizedBox(
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            return Container(
                                height: SizeConfig.height! * 0.20,
                                margin: const EdgeInsets.all(12),
                                child: CustomProductView(
                                  item: item[0][index],
                                ));
                          },
                          childCount: item[0].length,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 18,
                            ),
                            CustomTextView(
                                text: 'Choose Shipping',
                                fontSize: SizeConfig.textScaleFactor! * 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            const SizedBox(
                              height: 30,
                            ),
                            CustomShippingTypeButton(
                                title: 'Choose Shipping Type', onTap: () {}),
                            const SizedBox(
                              height: 24,
                            ),
                            const Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            CustomBillBoard(
                                price: item[1],
                                shippingCost: controller.shippingCost,
                                totalBill: item[1]),
                            const SizedBox(
                              height: 80,
                            ),
                          ],
                        ),
                      ),
                    ]),
                Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: Container(
                        width: SizeConfig.width,
                        height: SizeConfig.height! * 0.1,
                        alignment: Alignment.center,
                        color: Colors.white,
                        child: FittedBox(
                          child: CustomCheckOutButton(
                              minWidth: SizeConfig.width! * 0.8,
                              height: 35,
                              title: 'Continue to Payment',
                              onPress: () {},
                              icon: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              )),
                        )))
              ],
            ),
          ),
        ));
      },
    );
  }
}
