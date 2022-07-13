import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/db/db_model/add_cart_product.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/checkout/custom_location_button.dart';
import 'package:platzi_fake_store/view/components/widget/checkout/custom_product_view.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/page/checkout_screen/checkout_controller/checkout_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  List<AddCartProduct> get itemList => Get.arguments;

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
                padding: const EdgeInsets.only(left: 16,right: 16, top: 16),
                child: CustomScrollView(physics: const BouncingScrollPhysics(),
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
                            const SizedBox(height: 30,),
                            CustomLocationButton(title: 'Home', address: 'Jamgora, ashuliya , savar , dhaka', onTap: (){}),
                            const SizedBox(height: 24,),
                            const Divider(color: Colors.grey,height: 1,),
                            const SizedBox(height: 24,),
                            CustomTextView(
                                text: 'Order List',
                                fontSize: SizeConfig.textScaleFactor! * 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            const SizedBox(height: 24,),
                          ],
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return Container(
                                height: SizeConfig.height! * 0.20,
                                margin: const EdgeInsets.all(12),
                                child: CustomProductView(item: itemList[index],));
                          },
                          childCount: itemList.length,
                        ),
                      )
                    ]),
              ),
            ));
      },
    );
  }
}
