import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/navigator/app_pages.dart';
import 'package:platzi_fake_store/view/components/widget/custom_button.dart';
import 'package:platzi_fake_store/view/components/widget/custom_social_login_button.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/text_hint_button.dart';
import 'package:platzi_fake_store/view/page/auth/start_up_screen/start_up_controller/start_up_controller.dart';

class StartUpScreen extends StatelessWidget {
  const StartUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<StartUpController>(builder: (controller) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: ListView(
              shrinkWrap: true,
              reverse: true,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        width: 300, height: 200, "./assets/start_up.png"),
                    const SizedBox(
                      height: 32,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 54, right: 54),
                      child: Column(
                        children: const [
                          CustomTextView(
                              text: "Let's you in",
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomSocialLoginButton(
                              title: 'Continue with Google',
                              padding: 0,
                              buttonColor: Colors.white,
                              asset: "./assets/google.svg",
                              onPress: () => null),
                          CustomSocialLoginButton(
                              title: 'Continue with facebook',
                              padding: 16,
                              buttonColor: Colors.white,
                              asset: "./assets/facebook.svg",
                              onPress: () => null),
                          const SizedBox(height: 24,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(width: SizeConfig.width! * 0.3,height: 1,color: Colors.grey.shade400,),
                              const CustomTextView(
                                  text: "or",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                              Container(width: SizeConfig.width! * 0.3,height: 1,color: Colors.grey.shade400,),
                            ],
                          ),
                          const SizedBox(height: 24,),
                          CustomButton(title: "Sign in with password",textColor: Colors.white,color: Colors.black,onPress: (){
                            Get.toNamed(AppRoutes.loginScreen);
                          }),
                          TextHintButton(
                              padding: 16,
                              hintText: 'Don’t have an account ? ',
                              hintButtonText: 'Sign Up',
                              onTap: () {
                                Get.toNamed(AppRoutes.signUpScreen);
                              })
                        ],
                      ),
                    ),
                  ],
                ),
              ].reversed.toList(),
            ),
          ));
    });
  }
}
