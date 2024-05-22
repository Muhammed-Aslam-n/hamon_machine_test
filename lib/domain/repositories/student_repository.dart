
import 'package:hamon_machine_task/domain/entities/students_model.dart';

abstract class StudentRepository {
  Future<List<Student>> getAllStudents();
  Future<Student> getStudentById(int id);
}
