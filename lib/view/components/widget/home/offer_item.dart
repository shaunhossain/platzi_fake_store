import 'package:flutter/material.dart';
import 'package:platzi_fake_store/model/offer/offer.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view_with_line.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({Key? key, required this.offerDetails, required this.onTap}) : super(key: key);
  final Offer offerDetails;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: SizeConfig.width,
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(30)),
          child: Container(
              margin: const EdgeInsets.only(left: 30,  right: 10),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextView(
                          text: offerDetails.offerPercentage,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextView(
                          text: offerDetails.offerMassage,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        //color: Colors.blue,
                        width: SizeConfig.width! * 0.4,
                        child: CustomTextViewWithLine(
                            text: offerDetails.item.description,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
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
                          offerDetails.item.images!.last,
                          fit: BoxFit.fitWidth,
                        ),),
                  ),
                ],
              ))),
    );
  }
}
