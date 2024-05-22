
import 'package:dio/dio.dart';
import 'package:hamon_machine_task/data/models/student_model.dart';
import 'package:hamon_machine_task/domain/entities/students_model.dart';
import 'package:hamon_machine_task/domain/repositories/student_repository.dart';

class StudentRepositoryImpl implements StudentRepository {
  final Dio dio;
  final String apiKey;

  StudentRepositoryImpl({required this.dio, required this.apiKey});

  @override
  Future<List<Student>> getAllStudents() async {
    final response = await dio.get('/students', queryParameters: {'api_key': apiKey});
    final students = (response.data as List).map((json) => StudentModel.fromJson(json)).toList();
    return students;
  }

  @override
  Future<Student> getStudentById(int id) async {
    final response = await dio.get('/students/$id', queryParameters: {'api_key': apiKey});
    return StudentModel.fromJson(response.data);
  }
}
