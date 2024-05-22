
import 'package:hamon_machine_task/domain/repositories/registration_repository.dart';

class RemoveRegistration {
  final RegistrationRepository repository;

  RemoveRegistration(this.repository);

  Future<void> call(int id) {
    return repository.removeRegistration(id);
  }
}
