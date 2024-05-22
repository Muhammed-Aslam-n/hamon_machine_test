import 'package:hamon_machine_task/domain/repositories/registration_repository.dart';

class AddRegistration {
  final RegistrationRepository repository;

  AddRegistration(this.repository);

  Future<void> call(int studentId, int subjectId) {
    return repository.addRegistration(studentId, subjectId);
  }
}
