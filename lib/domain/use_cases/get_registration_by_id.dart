import 'package:hamon_machine_task/domain/entities/registration.dart';
import 'package:hamon_machine_task/domain/repositories/registration_repository.dart';

class GetRegistrationById {
  final RegistrationRepository repository;

  GetRegistrationById(this.repository);

  Future<Registration> call(int id) {
    return repository.getRegistrationById(id);
  }
}
