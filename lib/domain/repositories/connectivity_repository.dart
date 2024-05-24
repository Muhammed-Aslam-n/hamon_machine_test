// domain/repositories/connectivity_repository.dart

import 'package:hamon_machine_task/domain/entities/connectvity.dart';

abstract class ConnectivityRepository {
  Future<ConnectivityStatus> checkConnectivity();
  Stream<ConnectivityStatus> get connectivityStream;
}
