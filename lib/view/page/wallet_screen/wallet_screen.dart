import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/wallet/Custom_card_view.dart';
import 'package:platzi_fake_store/view/page/wallet_screen/wallet_controller/wallet_controller.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<WalletController>(
      builder: (controller) {
        return SafeArea(
            child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            title: CustomTextView(
                text: 'Wallet',
                fontSize: SizeConfig.textScaleFactor! * 24,
                fontWeight: FontWeight.w500,
                color: Colors.black),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search_rounded,
                    color: Colors.black,
                  )),
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
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  SliverToBoxAdapter(
                    child: CustomCardView(
                      name: 'Shaun Hossain',
                      balance: 500,
                      topUp: () {},
                    ),
                  )
                ]),
          ),
        ));
      },
    );
  }
}
