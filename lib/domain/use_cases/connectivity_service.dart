// domain/usecases/check_connectivity.dart

import 'package:hamon_machine_task/domain/entities/connectvity.dart';
import 'package:hamon_machine_task/domain/repositories/connectivity_repository.dart';

class CheckConnectivity {
  final ConnectivityRepository repository;

  CheckConnectivity(this.repository);

  Future<ConnectivityStatus> execute() {
    return repository.checkConnectivity();
  }
}
