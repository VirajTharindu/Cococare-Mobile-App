import 'dart:async';
import 'package:coconut_disease_detection/utils/popups/loaders.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

//manages network connectivity status & provides methods to check & control changes
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectivityStatus =
      ConnectivityResult.none.obs;

//initialization of network manager & set up a streak to continue the checking
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

//update the connection status based on changes in connectivity & show a relavant popup to the user
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectivityStatus.value = result;
    if (_connectivityStatus.value == ConnectivityResult.none) {
      CLoaders.warningSnackBar(
          title: 'No Internet Connection',
          message: 'Please check your internet connection and try again');
      //show a popup to the user
    }
  }

//dispose the stream subscription to avoid memory leaks
//
  @override
  void onClose() {
    super.onClose();
    _connectivitySubscription.cancel();
  }

//methods to check the current connectivity status
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }
}
