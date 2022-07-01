import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/model/sign_up_response/sign_up_response.dart';
import 'package:platzi_fake_store/utils/network_type/connection_type.dart';
import 'package:platzi_fake_store/view/components/navigator/app_pages.dart';
import 'package:platzi_fake_store/view/page/auth/sign_up_screen/sign_up_connect/sign_up_connect.dart';
import 'package:platzi_fake_store/view/services/initial_controller/initial_controller.dart';


class SignUpController extends GetxController{

  var showProgressBar = true.obs;
  var hidePassword = true.obs;
  RxString registrationErrorMessage = ''.obs;

  /// private
  final IRegistrationProvider _provider = IRegistrationProvider();
  final InitialController _controller = Get.find<InitialController>();

  /// _inputNumberKey use to check full form input list validation check
  final GlobalKey<FormState> inputKey = GlobalKey<FormState>();

  /// access driver PIN input text
  final userEmail = TextEditingController();
  final userName = TextEditingController();

  /// access driver mobile number input text
  final userPassword = TextEditingController();

  void passwordVisibility(){
    hidePassword.value = !hidePassword.value;
    log('password-> ${hidePassword.value}');
  }

  void sendRegistrationRequest({required String name,required String email, required String password}){

    if(_controller.connectionType.value == ConnectionType.mobile || _controller.connectionType.value == ConnectionType.wifi){
      showProgressBar(false);
      try {
        _provider.sendUserRegistrationRequest(name: name, email: email, password: password).then((value){
          try {
            final SignUpResponse userInfo = signUpResponseFromJson(value);
            log(userInfo.email);
            _checkLogin(userInfo: userInfo);
          } on Exception catch (e) {
            registrationErrorMessage.value ="Your input is wrong";
          }
          showProgressBar(true);
        }, onError: (error){
          showProgressBar(true);
          registrationErrorMessage.value ="Your input is wrong";
        });
      } on SocketException {
        registrationErrorMessage.value ="Your input is wrong";
      } on HttpException {
        registrationErrorMessage.value ="Your input is wrong";
      } on FormatException {
        registrationErrorMessage.value ="Your input is wrong";
      } catch (e) {
        registrationErrorMessage.value ="Your input is wrong";
      }
    } else{
      registrationErrorMessage.value ="No internet connection";
    }
  }


  void _checkLogin ({required SignUpResponse userInfo}) async {
    if(userInfo.name.isNotEmpty && userInfo.email.isNotEmpty){
      Get.offAllNamed(AppRoutes.loginScreen);
    } else{
      registrationErrorMessage.addError("Registration failed");
    }
  }
}