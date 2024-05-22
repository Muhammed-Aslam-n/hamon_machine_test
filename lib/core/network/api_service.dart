import 'package:dio/dio.dart';
import 'package:hamon_machine_task/core/utils/api_constants.dart';

class ApiService {
  final Dio _dio;

  ApiService(this._dio) {
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.options.queryParameters = {'api_key': ApiConstants.apiKey};
  }

  Future<List<dynamic>> getStudents() async {
    final response = await _dio.get(ApiConstants.students);
    return response.data;
  }

  Future<Map<String, dynamic>> getStudentDetails(int id) async {
    final response = await _dio.get('${ApiConstants.students}/$id');
    return response.data;
  }

// Similarly, define methods for subjects, classrooms, and registrations
}
