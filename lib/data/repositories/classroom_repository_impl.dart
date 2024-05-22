import 'package:dio/dio.dart';
import 'package:hamon_machine_task/data/models/classroom_model.dart';
import 'package:hamon_machine_task/domain/entities/classroom.dart';
import 'package:hamon_machine_task/domain/repositories/classroom_repository.dart';

class ClassroomRepositoryImpl implements ClassroomRepository {
  final Dio dio;
  final String apiKey;

  ClassroomRepositoryImpl({required this.dio, required this.apiKey});

  @override
  Future<List<Classroom>> getAllClassrooms() async {
    final response = await dio.get('/classrooms', queryParameters: {'api_key': apiKey});
    final classrooms = (response.data as List).map((json) => ClassroomModel.fromJson(json)).toList();
    return classrooms;
  }

  @override
  Future<Classroom> getClassroomById(int id) async {
    final response = await dio.get('/classrooms/$id', queryParameters: {'api_key': apiKey});
    return ClassroomModel.fromJson(response.data);
  }

  @override
  Future<void> assignSubjectToClassroom(int classroomId, int subjectId) async {
    await dio.patch('/classrooms/$classroomId', data: {'subject': subjectId}, queryParameters: {'api_key': apiKey});
  }
}
