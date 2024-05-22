import 'package:dio/dio.dart';
import 'package:hamon_machine_task/core/network/api_service.dart';
import 'package:hamon_machine_task/domain/entities/students_model.dart';

class RemoteDataSource {
  final ApiService apiService;

  RemoteDataSource(this.apiService);

  Future<List<Student>> fetchStudents() async {
    final studentsJson = await apiService.getStudents();
    return studentsJson.map((json) => Student.fromJson(json)).toList();
  }
}
