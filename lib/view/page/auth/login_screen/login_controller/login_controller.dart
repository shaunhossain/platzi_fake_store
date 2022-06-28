import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/network_type/connection_type.dart';
import 'package:platzi_fake_store/view/page/auth/login_screen/login_connect/login_connect.dart';
import 'package:platzi_fake_store/view/services/initial_controller/initial_controller.dart';

class LoginController extends GetxController {
  var showProgressBar = true.obs;
  var hidePassword = true.obs;
  RxString loginErrorMessage = ''.obs;

  /// private
  final ILoginProvider _provider = ILoginProvider();
  //final _storage = StoreUserSessions();
  final InitialController _controller = Get.find<InitialController>();

  /// _inputNumberKey use to check full form input list validation check
  final GlobalKey<FormState> inputKey = GlobalKey<FormState>();

  /// access driver PIN input text
  final userEmail = TextEditingController();

  /// access driver mobile number input text
  final userPassword = TextEditingController();

  void passwordVisibility(){
    hidePassword.value = !hidePassword.value;
    log('password-> ${hidePassword.value}');
  }


  void sendLoginRequest({required String email, required String password, required String nextRoute}){
    log("internet : ${_controller.toString()}");
    if(_controller.connectionType.value == ConnectionType.mobile || _controller.connectionType.value == ConnectionType.wifi){
      showProgressBar(false);
      try {
        _provider.sendUserLoginRequest(email: email, password: password).then((value){
          try {
            //final LoginResponse userInfo = loginResponseFromJson(value);
            // log(userInfo.data!.user.email);
            // _insertUserSession(userInfo: userInfo);
            // _checkLogin(userInfo: userInfo, destination: nextRoute, );
          } on Exception catch (e) {
            loginErrorMessage.value ="Your input is wrong";
          }
          showProgressBar(true);
        }, onError: (error){
          showProgressBar(true);
          loginErrorMessage.value ="Your input is wrong";
        });
      } on SocketException {
        loginErrorMessage.value ="Your input is wrong";
      } on HttpException {
        loginErrorMessage.value ="Your input is wrong";
      } on FormatException {
        loginErrorMessage.value ="Your input is wrong";
      } catch (e) {
        loginErrorMessage.value ="Your input is wrong";
      }
    } else{
      loginErrorMessage.value ="No internet connection";
    }
  }

  // Future<void> _insertUserSession({required LoginResponse userInfo}) async {
  //   await _storage.storeUserInfo(token: userInfo.data!.token.accessToken, userId: userInfo.data!.user.id, userEmail: userInfo.data!.user.email);
  // }

  // Future<bool> hasLoginSession () async {
  //   String? _token = await _storage.getToken();
  //   if(_token!.isNotEmpty){
  //     return true;
  //   }
  //   return false;
  // }

  // void _checkLogin ({required LoginResponse userInfo, required String destination}) async {
  //   if(userInfo.data!.token.accessToken.isNotEmpty){
  //     goToRoutes(routeName: destination);
  //   } else{
  //     loginErrorMessage.addError("Your input is wrong");
  //   }
  // }

  // Future<void> goToRoutes({required String routeName}) async {
  //   switch(routeName){
  //     case "Challenge":
  //       Get.offNamed(AppRoutes.challengePage);
  //       break;
  //     case "Habit":
  //       Get.offNamed(AppRoutes.habitsPage);
  //       break;
  //     case "Bills":
  //       Get.offNamed(AppRoutes.billboardPage);
  //       break;
  //     case "To-do":
  //       Get.offNamed(AppRoutes.todoPage);
  //       break;
  //     case "main-screen":
  //       Get.offAllNamed(AppRoutes.mainScreen);
  //       break;
  //   }
  // }

  Future signInWithGoogle() async {
    //final user =  await GoogleSignInApi.login;
    // log('userName ${user!.email}');
    // log('token ${user.serverAuthCode}');
  }

  Future signOutFromGoogle() async {
    //await GoogleSignInApi.logout;
    log('disconnect from google account');
  }

  Future signInWithFacebook() async {
    // final user =  await FacebookSignInApi.login();
    // if (user.status == LoginStatus.success) {
    //   final AccessToken accessToken = user.accessToken!;
    //   log('token ${accessToken.token}');
    // } else {
    //   log("${user.status}");
    //   log("${user.message}");
    // }
    // log('userName ${user.status}');
  }

  Future signOutFromFacebook() async {
    //await GoogleSignInApi.logout;
    log('disconnect from google account');
  }


  @override
  void onClose() {
    _provider.dispose();
    super.onClose();
  }
}