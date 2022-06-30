import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/size_config.dart';
import 'package:platzi_fake_store/view/components/navigator/app_pages.dart';
import 'package:platzi_fake_store/view/components/widget/custom_email_input_field.dart';
import 'package:platzi_fake_store/view/components/widget/custom_login_button.dart';
import 'package:platzi_fake_store/view/components/widget/custom_password_input_field.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view.dart';
import 'package:platzi_fake_store/view/components/widget/custom_text_view_with_line.dart';
import 'package:platzi_fake_store/view/components/widget/login/header.dart';
import 'package:platzi_fake_store/view/components/widget/navigate_back_button.dart';
import 'package:platzi_fake_store/view/components/widget/social_login_button.dart';
import 'package:platzi_fake_store/view/components/widget/text_hint_button.dart';
import 'package:platzi_fake_store/view/page/auth/login_screen/login_controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<LoginController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(SizeConfig.height! * 0.085),
              child: NavigateBackButton(
                  icon: Icons.arrow_back,
                  onPress: () => Get.back())),
          body: Padding(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: ListView(
              shrinkWrap: true,
              reverse: true,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(spaceHeight: 60, title: "Login to your \naccount"),
                    const SizedBox(
                      height: 38,
                    ),
                    loginInputForm(controller: controller),
                    footer(controller: controller),
                  ],
                ),
              ].reversed.toList(),
            ),
          ),
        ),
      );
    });
  }

  Widget loginInputForm({required LoginController controller}) {
    return Form(
        key: controller.inputKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomEmailInputField(
              title: 'Email', spacing: 8, userInput: controller.userEmail, hint: 'enter email',),
            SizedBox(
              height: SizeConfig.height! * 0.017,
            ),
            Obx((){
              return CustomPasswordInputField(
                title: 'Password', spacing: 8, userPassword: controller.userPassword, onPress: () {
                controller.passwordVisibility();
              }, visibility: controller.hidePassword.value,);
            }),
            Obx(() => Visibility(
                visible: controller.loginErrorMessage.value == '' ? false : true,
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.height! * 0.016,
                    ),
                    CustomTextViewWithLine(
                        text: controller.loginErrorMessage.value,
                        color: Colors.red,
                        fontSize: SizeConfig.textScaleFactor! * 16,
                        fontWeight: FontWeight.w400),
                  ],
                ))),
          ],
        ));
  }

  Widget footer({required LoginController controller}) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Obx((){
          return CustomLoginButton(
              minWidth: SizeConfig.width,
              height: 44,
              title: "Log in",
              showProgress:  controller.showProgressBar.value,//controller.showProgressBar.value,
              onPress: () async {
                FocusManager.instance.primaryFocus!.unfocus();
                if (controller.inputKey.currentState!.validate()) {
                  controller.sendLoginRequest(
                      email: controller.userEmail.text,
                      password: controller.userPassword.text,
                      nextRoute: 'main-screen');
                }
              });
        }),
        // CustomLoginButton(
        //     minWidth: SizeConfig.width,
        //     height: 44,
        //     title: "Log in",
        //     showProgress:  false,//controller.showProgressBar.value,
        //     onPress: () async {
        //       Get.toNamed(AppRoutes.mainScreen);
        //       //FocusManager.instance.primaryFocus!.unfocus();
        //       // if (controller.inputKey.currentState!.validate()) {
        //       //   controller.sendLoginRequest(
        //       //       email: controller.userEmail.text,
        //       //       password: controller.userPassword.text,
        //       //       nextRoute: nextRoute);
        //       // }
        //     }),
        Center(
          child: Column(
            children: [
              TextHintButton(
                  padding: 16,
                  hintText: 'Forget Password ? ',
                  hintButtonText: 'Recover',
                  onTap: () {

                  }),
              const SizedBox(
                height: 30,
              ),
              const Center(
                  child: CustomTextView(
                      text: 'Or continue with',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.black)),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialLoginButton(
                      minWidth: 62,
                      height: 42,
                      asset: "./assets/google.svg",
                      onPress: () {
                        //controller.signInWithGoogle();
                      }),
                  const SizedBox(
                    width: 16,
                  ),
                  SocialLoginButton(
                      minWidth: 62,
                      height: 42,
                      asset: "./assets/facebook.svg",
                      onPress: () {
                        //controller.signInWithFacebook();
                      }),
                ],
              ),
              TextHintButton(
                  padding: 16,
                  hintText: 'Don’t have an account ? ',
                  hintButtonText: 'Sign Up',
                  onTap: () {
                    //Get.toNamed(AppRoutes.signUpPage);
                  })
            ],
          ),
        )
      ],
    );
  }
}
