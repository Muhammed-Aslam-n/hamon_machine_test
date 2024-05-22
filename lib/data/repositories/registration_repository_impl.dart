import 'package:dio/dio.dart';
import 'package:hamon_machine_task/data/models/registration_model.dart';
import 'package:hamon_machine_task/domain/entities/registration.dart';
import 'package:hamon_machine_task/domain/repositories/registration_repository.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  final Dio dio;
  final String apiKey;

  RegistrationRepositoryImpl({required this.dio, required this.apiKey});

  @override
  Future<List<Registration>> getAllRegistrations() async {
    final response = await dio.get('/registration', queryParameters: {'api_key': apiKey});
    final registrations = (response.data['registrations'] as List).map((json) => RegistrationModel.fromJson(json)).toList();
    return registrations;
  }

  @override
  Future<Registration> getRegistrationById(int id) async {
    final response = await dio.get('/registration/$id', queryParameters: {'api_key': apiKey});
    return RegistrationModel.fromJson(response.data);
  }

  @override
  Future<void> addRegistration(int studentId, int subjectId) async {
    await dio.post('/registration', data: {'student': studentId, 'subject': subjectId}, queryParameters: {'api_key': apiKey});
  }

  @override
  Future<void> removeRegistration(int id) async {
    await dio.delete('/registration/$id', queryParameters: {'api_key': apiKey});
  }
}
