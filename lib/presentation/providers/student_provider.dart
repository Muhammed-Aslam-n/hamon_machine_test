import 'package:flutter/material.dart';
import 'package:hamon_machine_task/domain/entities/students_model.dart';
import 'package:hamon_machine_task/domain/use_cases/get_all_students.dart';
import 'package:hamon_machine_task/domain/use_cases/get_student_by_id.dart';

class StudentProvider with ChangeNotifier {
  final GetAllStudents getAllStudents;
  final GetStudentById getStudentById;

  bool isLoading = false;
  bool fetchStudentByIdLoading = false;

  bool? error;
  bool? fetchStudentByIdError;

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
      isLoading = true;
      error = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
      _students = await getAllStudents();
      isLoading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    } catch (exc, stack) {
      debugPrint('ExceptionCaughtWhileFetchingAllStudents $exc \n $stack');
      isLoading = false;
      error = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }

  Future<void> fetchStudentById(int id) async {
    try {
      fetchStudentByIdLoading = true;
      fetchStudentByIdError = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
      _student = await getStudentById(id);
      fetchStudentByIdLoading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    } catch (exc, stack) {
      debugPrint('ExceptionCaughtWhileFetchingSingleStudent $exc \n $stack');
      fetchStudentByIdLoading = false;
      fetchStudentByIdError = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }
}
