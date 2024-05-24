// data/repositories/connectivity_repository_impl.dart
import 'package:hamon_machine_task/data/data_sources/connectivity_data_source.dart';
import 'package:hamon_machine_task/domain/entities/connectvity.dart';
import 'package:hamon_machine_task/domain/repositories/connectivity_repository.dart';

class ConnectivityRepositoryImpl implements ConnectivityRepository {
  final ConnectivityDataSource dataSource;

  ConnectivityRepositoryImpl(this.dataSource);

  @override
  Future<ConnectivityStatus> checkConnectivity() {
    return dataSource.getConnectivityStatus();
  }
  @override
  Stream<ConnectivityStatus> get connectivityStream {
    return dataSource.connectivityStream;
  }
}
