import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class CustomLocationButton extends StatelessWidget {
  const CustomLocationButton({Key? key, required this.title, required this.address, required this.onTap}) : super(key: key);
  final String title;
  final String address;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  Container(
        width: SizeConfig.width,
        padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: SizeConfig.width! * 0.15,
              height: SizeConfig.width! * 0.15,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Card(
                elevation: 1,
                shape: StadiumBorder(
                  side: BorderSide(
                    color: Colors.grey.shade600,
                    width: 6,
                  ),
                ),
                child: const ClipOval(
                  clipBehavior: Clip.antiAlias,
                  child: Icon(Icons.location_on_outlined,size: 28,),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextView(
                    text: title,
                    fontSize: SizeConfig.textScaleFactor! * 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
                CustomTextView(
                    text: address,
                    fontSize: SizeConfig.textScaleFactor! * 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600),
              ],
            ),
            const Icon(
              Icons.edit_location_alt_outlined,
              color: Colors.black,
              size: 28,
            ),
          ],
        ),
      ),
    );
  }
}
