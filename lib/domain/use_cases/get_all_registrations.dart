
import 'package:hamon_machine_task/domain/entities/registration.dart';
import 'package:hamon_machine_task/domain/repositories/registration_repository.dart';

class GetAllRegistrations {
  final RegistrationRepository repository;

  GetAllRegistrations(this.repository);

  Future<List<Registration>> call() {
    return repository.getAllRegistrations();
  }
}
