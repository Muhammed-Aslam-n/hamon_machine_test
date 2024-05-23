import 'dart:convert';

import 'package:hamon_machine_task/core/network/clients.dart';
import 'package:hamon_machine_task/data/models/student_model.dart';
import 'package:hamon_machine_task/domain/entities/students_model.dart';
import 'package:hamon_machine_task/domain/repositories/student_repository.dart';

class StudentRepositoryImpl implements StudentRepository {
  final CustomHttpClient httpClient;
  final String apiKey;

  StudentRepositoryImpl({required this.httpClient, required this.apiKey});

  @override
  Future<List<Student>> getAllStudents() async {
    final response = await httpClient.get('/students', queryParameters: {'api_key': apiKey});
    final students = (jsonDecode(response.body)['students'] as List).map((json) => StudentModel.fromJson(json)).toList();
    return students;
  }

  @override
  Future<Student> getStudentById(int id) async {
    final response = await httpClient.get('/students/$id', queryParameters: {'api_key': apiKey});
    return StudentModel.fromJson(jsonDecode(response.body));
  }
}
