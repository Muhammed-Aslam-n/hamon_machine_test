import 'package:flutter/material.dart';
import 'package:hamon_machine_task/domain/entities/students_model.dart';
import 'package:hamon_machine_task/domain/use_cases/get_all_students.dart';
import 'package:hamon_machine_task/domain/use_cases/get_student_by_id.dart';
class StudentProvider with ChangeNotifier {
  final GetAllStudents getAllStudents;
  final GetStudentById getStudentById;

  StudentProvider({
    required this.getAllStudents,
    required this.getStudentById,
  });

  List<Student>? _students;
  Student? _student;

  List<Student>? get students => _students;
  Student? get student => _student;

  Future<void> fetchAllStudents() async {
    _students = await getAllStudents();
    notifyListeners();
  }

  Future<void> fetchStudentById(int id) async {
    _student = await getStudentById(id);
    notifyListeners();
  }
}