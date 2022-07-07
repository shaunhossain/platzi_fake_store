import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/navigator/app_pages.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/home/offer_item.dart';
import 'package:platzi_fake_store/view/page/special_offer_screen/special_offer_controller/special_offer_controller.dart';

class SpecialOfferScreen extends StatelessWidget {
  const SpecialOfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<SpecialOfferController>(builder: (controller) {
      return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              title: CustomTextView(
                  text: "Special Offers",
                  fontSize: SizeConfig.textScaleFactor! * 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
              backgroundColor: Colors.white,
              bottomOpacity: 0.0,
              elevation: 0.3,
            ),
            body: Obx(() {
              return SizedBox(
                height: SizeConfig.height,
                child: ListView.builder(
                    itemCount: controller
                        .offerList
                        .length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: SizeConfig.height! * 0.25,
                        padding: const EdgeInsets.all(12),
                          child: OfferItem(offerDetails: controller.offerList[index], onTap: () {
                            Get.toNamed(AppRoutes.viewProductScreen,
                                arguments: controller.offerList[index].item);
                          },));
                    }),
              );
            }),
          ));
    });
  }
}
