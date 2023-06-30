import 'dart:async';

import 'package:architecture_designed/presentation/widgets/app_snack_bar.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
  Future<bool> get isDisconnected;
}

class NetworkInfoImpl with ChangeNotifier implements NetworkInfo {
  NetworkInfoImpl(this.connectivity, {required this.logger});

  final Connectivity connectivity;
  final Logger logger;

  ConnectivityResult connectionStatus = ConnectivityResult.none;
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  Future<bool> get isConnected async {
    final status = await connectivity.checkConnectivity();
    return status != ConnectivityResult.none;
  }

  @override
  Future<bool> get isDisconnected async {
    final status = await connectivity.checkConnectivity();
    return status == ConnectivityResult.none;
  }

  void init() {
    _checkConnection();
    _connectivitySubscription = connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _checkConnection() async {
    try {
      connectionStatus = await connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      logger.e(e, "Couldn't check connectivity status");
      _updateConnectionStatus(ConnectivityResult.none);
    }

    if (connectionStatus == ConnectivityResult.none) {
      _updateConnectionStatus(ConnectivityResult.none);
    }

    _updateConnectionStatus(connectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    connectionStatus = result;
    if (connectionStatus == ConnectivityResult.none) {
      AppSnackBar.show('No Internet Connection Available.', duration: const Duration(days: 1), backgroundColor: Colors.redAccent);
    } else {
      AppSnackBar.show('Reconnect successfully!', duration: const Duration(seconds: 2));
      AppSnackBar.hide();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}
