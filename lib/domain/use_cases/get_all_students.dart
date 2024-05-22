
import 'package:hamon_machine_task/domain/entities/students_model.dart';
import 'package:hamon_machine_task/domain/repositories/student_repository.dart';

class GetAllStudents {
  final StudentRepository repository;

  GetAllStudents(this.repository);

  Future<List<Student>> call() {
    return repository.getAllStudents();
  }
}
