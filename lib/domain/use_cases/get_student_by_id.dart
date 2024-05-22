
import 'package:hamon_machine_task/domain/entities/students_model.dart';
import 'package:hamon_machine_task/domain/repositories/student_repository.dart';

class GetStudentById {
  final StudentRepository repository;

  GetStudentById(this.repository);

  Future<Student> call(int id) {
    return repository.getStudentById(id);
  }
}
