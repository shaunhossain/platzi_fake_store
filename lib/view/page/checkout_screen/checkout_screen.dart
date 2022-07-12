import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/endpoint.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/page/checkout_screen/checkout_controller/checkout_controller.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

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
                                        demoProfilePic,
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
                                                text: 'test',
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
                                                color: Colors.grey),
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
                                          const CustomTextView(
                                              text: 'size = M',
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
                                              text: '\u0024456',
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
                                                text: '1',
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
                            const SizedBox(height: 24,),
                            const Divider(color: Colors.grey,height: 1,),
                            const SizedBox(height: 24,),
                            CustomTextView(
                                text: 'Order List',
                                fontSize: SizeConfig.textScaleFactor! * 24,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                            const SizedBox(height: 24,),
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
                                        demoProfilePic,
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
                                                text: 'test',
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
                                                color: Colors.grey),
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
                                          const CustomTextView(
                                              text: 'size = M',
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
                                              text: '\u0024456',
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
                                                text: '1',
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
                          ],
                        ),
                      )
                    ]),
              ),
            ));
      },
    );
  }
}
