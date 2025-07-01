import 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectionChecker {
  Future<bool> get isConnected;
}

class ConnectionCheckerImpl implements ConnectionChecker {
  @override
  Future<bool> get isConnected async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return !(connectivityResult.contains(ConnectivityResult.none));
  }
}
