
import 'package:hamon_machine_task/domain/entities/registration.dart';

abstract class RegistrationRepository {
  Future<List<Registration>> getAllRegistrations();
  Future<Registration> getRegistrationById(int id);
  Future<void> addRegistration(int studentId, int subjectId);
  Future<void> removeRegistration(int id);
}
