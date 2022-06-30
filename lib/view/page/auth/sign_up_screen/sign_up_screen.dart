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
import 'package:platzi_fake_store/view/page/auth/sign_up_screen/sign_up_controller/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetBuilder<SignUpController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(SizeConfig.height! * 0.085),
              child: NavigateBackButton(
                  icon: Icons.arrow_back, onPress: () => Get.back())),
          body: Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32, bottom: 32),
            child: ListView(
              shrinkWrap: true,
              reverse: true,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Header(spaceHeight: 52, title: 'Create\nAccount'),
                    const SizedBox(
                      height: 40,
                    ),
                    registrationInputForm(controller: controller),
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

  Widget registrationInputForm({required SignUpController controller}) {
    return Form(
        key: controller.inputKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomEmailInputField(
              title: 'User Name',
              spacing: 8,
              userInput: controller.userName,
              hint: 'enter name',
            ),
            SizedBox(
              height: SizeConfig.height! * 0.017,
            ),
            CustomEmailInputField(
              title: 'Email',
              spacing: 8,
              userInput: controller.userEmail,
              hint: 'enter email',
            ),
            SizedBox(
              height: SizeConfig.height! * 0.017,
            ),
            Obx(() {
              return CustomPasswordInputField(
                title: 'Password',
                spacing: 8,
                userPassword: controller.userPassword,
                onPress: () {
                  controller.passwordVisibility();
                },
                visibility: controller.hidePassword.value,
              );
            }),
            Visibility(
                visible: controller.registrationErrorMessage.value == ''
                    ? false
                    : true,
                child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.height! * 0.016,
                    ),
                    CustomTextViewWithLine(
                        text: controller.registrationErrorMessage.value,
                        color: Colors.red,
                        fontSize: SizeConfig.textScaleFactor! * 16,
                        fontWeight: FontWeight.w400),
                  ],
                )),
          ],
        ));
  }

  Widget footer({required SignUpController controller}) {
    return Column(
      children: [
        const SizedBox(
          height: 24,
        ),
        Obx(() {
          return CustomLoginButton(
              minWidth: SizeConfig.width,
              height: 44,
              title: 'Create account',
              showProgress: controller.showProgressBar.value,
              onPress: () {
                FocusManager.instance.primaryFocus!.unfocus();
                if (controller.inputKey.currentState!.validate()) {
                  controller.sendRegistrationRequest(
                    name: controller.userName.text,
                    email: controller.userEmail.text,
                    password: controller.userPassword.text,
                  );
                }
              });
        }),
        Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
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
                      minWidth: 72,
                      height: 36,
                      asset: "./assets/google.svg",
                      onPress: () {}),
                  const SizedBox(
                    width: 16,
                  ),
                  SocialLoginButton(
                      minWidth: 72,
                      height: 36,
                      asset: "./assets/facebook.svg",
                      onPress: () {}),
                ],
              ),
              const SizedBox(
                height: 41,
              ),
              TextHintButton(
                  padding: 0,
                  hintText: 'Already have an account ? ',
                  hintButtonText: 'Log in',
                  onTap: () {
                    Get.toNamed(AppRoutes.loginScreen);
                  }),
            ],
          ),
        )
      ],
    );
  }
}
