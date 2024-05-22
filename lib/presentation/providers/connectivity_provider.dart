import 'package:flutter/widgets.dart';
import 'package:hamon_machine_task/domain/services/connectivity_service.dart';

class ConnectivityProvider with ChangeNotifier {
  final ConnectivityService connectivityService;

  bool _isConnected = false;
  bool get isConnected => _isConnected;

  ConnectivityProvider({required this.connectivityService}) {
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    _isConnected = await connectivityService.isConnected();
    notifyListeners();
  }
}
