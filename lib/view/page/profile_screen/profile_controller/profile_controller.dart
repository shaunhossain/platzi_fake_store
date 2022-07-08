import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:platzi_fake_store/model/profile/profile.dart';
import 'package:platzi_fake_store/utils/network_type/connection_type.dart';
import 'package:platzi_fake_store/utils/store_user_sessions/store_user_sessions.dart';
import 'package:platzi_fake_store/view/page/profile_screen/profile_connect/profile_connect.dart';
import 'package:platzi_fake_store/view/services/initial_controller/initial_controller.dart';

class ProfileController extends GetxController {
  final _storage = StoreUserSessions();
  final RxString dataFetchingError = ''.obs;
  var profileInfo = <Profile>[].obs;

  final IProfileProvider _profileProvider = IProfileProvider();
  final InitialController _controller = Get.find<InitialController>();

  @override
  void onInit() async {
    super.onInit();
    String? token = await _storage.getToken();
    Future.delayed( Duration.zero,(){
      getUserInfo(token: token!);
    });
  }

  Future<void> getUserInfo({required String token}) async {
    if(_controller.connectionType.value == ConnectionType.mobile || _controller.connectionType.value == ConnectionType.wifi){
      try {
        _profileProvider.getUserProfileInfo(token: token).then((value){
          try {
            final Profile response = profileFromJson(value);
            profileInfo.add(response);
            log("profile name -> ${response.name}");

          } on Exception catch (e) {
            dataFetchingError.value ="$e";
          }
        }, onError: (error){
          dataFetchingError.value ="$error";
        });
      } on SocketException {
        dataFetchingError.value ="No internet connection";
      }
    } else{
      dataFetchingError.value ="No internet connection";
    }
  }
}