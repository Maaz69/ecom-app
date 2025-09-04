import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecom/utils/popups/loaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

/// Manages the network connectivity status and provides methods
/// to check and handle connectivity changes.
class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectionStatus = ConnectivityResult.none.obs;

  /// Initialize the network manager and set up a stream to continually check connection status.
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    _initializeConnection();
  }

  /// Perform an initial check on app launch.
  Future<void> _initializeConnection() async {
    final result = await _connectivity.checkConnectivity();
    await _updateConnectionStatus(result);
  }

  /// Update the connection status and show a warning if no internet.
  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectionStatus.value = result;

    if (result == ConnectivityResult.none) {
      TLoaders.warningSnackBar(title: 'No Internet Connection');
    }
  }

  /// Check the internet connection status.
  /// Returns `true` if connected, `false` otherwise.
  Future<bool> isConnected() async {
    try {
      final result = await _connectivity.checkConnectivity();
      return result != ConnectivityResult.none;
    } on PlatformException {
      return false;
    }
  }

  /// Dispose or close the active connectivity stream.
  @override
  void onClose() {
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
