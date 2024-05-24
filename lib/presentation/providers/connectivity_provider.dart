// presentation/providers/connectivity_provider.dart

import 'package:flutter/cupertino.dart';
import 'package:hamon_machine_task/domain/use_cases/connectivity_service.dart';
class ConnectivityProvider extends ChangeNotifier {

  final CheckConnectivity checkConnectivity;

  ConnectivityProvider({required this.checkConnectivity}) {
    _initConnectivity();
  }

  bool _isConnected = true;

  bool get isConnected => _isConnected;

  void _initConnectivity() async {
    final status = await checkConnectivity.execute();
    _isConnected = status.isConnected;
    notifyListeners();

    checkConnectivity.repository.connectivityStream.listen((status) {
      _isConnected = status.isConnected;
      notifyListeners();
    });
  }
}
