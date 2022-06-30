import 'dart:async';

import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/store_user_sessions/store_user_sessions.dart';
import 'package:platzi_fake_store/view/components/navigator/app_pages.dart';

class StartUpController extends GetxController {

  final _storage = StoreUserSessions();

  @override
  Future<void> onInit() async {
    super.onInit();

    String? token = await _storage.getToken();
    if(token != null && token.isNotEmpty){
      Get.offAndToNamed(AppRoutes.mainScreen);
    }else{
      Timer(const Duration(seconds: 2), () async {
        Get.offAndToNamed(AppRoutes.loginScreen);
      });
    }
  }
}