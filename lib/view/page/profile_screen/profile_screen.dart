import 'package:flutter/material.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          title: CustomTextView(
              text: "Profile",
              fontSize: SizeConfig.textScaleFactor! * 24,
              fontWeight: FontWeight.w500,
              color: Colors.black),
          backgroundColor: Colors.white,
          bottomOpacity: 0.0,
          elevation: 0.3,
        ),
      ),
    );
  }
}
