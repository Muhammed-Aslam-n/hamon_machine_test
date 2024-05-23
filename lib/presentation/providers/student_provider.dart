import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/logger.dart';
import 'package:hamon_machine_task/domain/entities/students_model.dart';
import 'package:hamon_machine_task/domain/use_cases/get_all_students.dart';
import 'package:hamon_machine_task/domain/use_cases/get_student_by_id.dart';

class StudentProvider with ChangeNotifier {
  final GetAllStudents getAllStudents;
  final GetStudentById getStudentById;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool? _error;

  bool? get error => _error;

  StudentProvider({
    required this.getAllStudents,
    required this.getStudentById,
  });

  List<Student>? _students;
  Student? _student;

  List<Student>? get students => _students;

  Student? get student => _student;

  Future<void> fetchAllStudents() async {
    try {
      _isLoading = true;
      _error = false;
      notifyListeners();
      _students = await getAllStudents();
      _isLoading = false;
      notifyListeners();
    } catch (exc, stack) {
      printError('ExceptionCaughtWhileFetchingAllStudents $exc \n $stack');
      _isLoading = false;
      _error = true;
      notifyListeners();
    }
  }

  Future<void> fetchStudentById(int id) async {
    try {
      _isLoading = true;
      _error = false;
      notifyListeners();
      _student = await getStudentById(id);
      _isLoading = false;
      notifyListeners();
    } catch (exc, stack) {
      printError('ExceptionCaughtWhileFetchingSingleStudent $exc \n $stack');
      _isLoading = false;
      _error = true;
      notifyListeners();
    }
  }
}
