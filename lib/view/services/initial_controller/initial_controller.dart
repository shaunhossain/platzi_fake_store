import 'dart:async';
import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:platzi_fake_store/utils/network_type/connection_type.dart';

class InitialController extends GetxController {
  /// this variable 0 = No Internet, 1 = connected to WIFI ,2 = connected to Mobile Data.
  var connectionType = 0.obs;

  /// Instance of Flutter Connectivity
  final Connectivity _connectivity = Connectivity();

  /// Stream to keep listening to network change state
  late StreamSubscription _streamSubscription;

  @override
  Future<void> onInit() async {
    super.onInit();
    //_requestPermissions();
    getConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
  }

  /// a method to get which connection result, if you we connected to internet or no if yes then which network
  Future<void> getConnectionType() async {
    late ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } on PlatformException catch (e) {
      log(e.toString());
    }
    return _updateState(connectivityResult);
  }

  /// state update, of network, if you are connected to WIFI connectionType will get set to 1,
  /// and update the state to the consumer of that variable.
  _updateState(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.wifi:
        log(ConnectivityResult.wifi.toString());
        connectionType.value = ConnectionType.wifi;
        break;
      case ConnectivityResult.mobile:
        log(ConnectivityResult.mobile.toString());
        connectionType.value = ConnectionType.mobile;
        break;
      case ConnectivityResult.none:
        log(ConnectivityResult.none.toString());
        connectionType.value = ConnectionType.offline;
        break;
      default:
        Get.snackbar('Network Error', 'Failed to get Network Status');
        break;
    }
  }

  @override
  void onClose() {
    /// stop listening to network state when app is closed
    _streamSubscription.cancel();
  }

  // Future<void> _requestPermissions() async {
  //   await SystemAlertWindow.requestPermissions(prefMode: SystemWindowPrefMode.OVERLAY);
  // }
}
