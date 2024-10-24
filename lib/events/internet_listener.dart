import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class InternetListener {

  var _connectionStatus = <ConnectivityResult>[ConnectivityResult.none];
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  InternetListener._create();

  static InternetListener? _instance;

  factory InternetListener.get() => _instance ??= InternetListener._create();

}