
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hamon_machine_task/domain/services/connectivity_service.dart';

class ConnectivityServiceImpl implements ConnectivityService {
  final Connectivity _connectivity = Connectivity();

  @override
  Future<bool> isConnected() async {
    var connectivityResult = await _connectivity.checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
