// data/datasources/connectivity_data_source.dart

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hamon_machine_task/domain/entities/connectvity.dart';

class ConnectivityDataSource {
  Future<ConnectivityStatus> getConnectivityStatus() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return ConnectivityStatus(isConnected: connectivityResult != ConnectivityResult.none);
  }

  Stream<ConnectivityStatus> get connectivityStream async* {
    await for (var result in Connectivity().onConnectivityChanged) {
      yield ConnectivityStatus(isConnected: result != ConnectivityResult.none);
    }
  }
}
