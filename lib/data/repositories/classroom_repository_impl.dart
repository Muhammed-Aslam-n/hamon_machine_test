import 'dart:convert';

import 'package:hamon_machine_task/core/network/clients.dart';
import 'package:hamon_machine_task/data/models/classroom_model.dart';
import 'package:hamon_machine_task/data/models/subject_model.dart';
import 'package:hamon_machine_task/domain/entities/classroom.dart';
import 'package:hamon_machine_task/domain/entities/subject_entities.dart';
import 'package:hamon_machine_task/domain/repositories/classroom_repository.dart';

class ClassroomRepositoryImpl implements ClassroomRepository {
  final CustomHttpClient httpClient;

  final String apiKey;

  ClassroomRepositoryImpl({required this.httpClient, required this.apiKey});

  @override
  Future<List<Classroom>> getAllClassrooms() async {
    final response = await httpClient.get('/classrooms', queryParameters: {'api_key': apiKey});
    final classrooms = (jsonDecode(response.body)['classrooms'] as List)
        .map((json) => ClassroomModel.fromJson(json))
        .toList();
    return classrooms;
  }

  @override
  Future<Classroom> getClassroomById(int id) async {
    final response = await httpClient.get('/classrooms/$id', queryParameters: {'api_key': apiKey});
    return ClassroomModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<void> assignSubjectToClassroom(int classroomId, int subjectId) async {
    final body = {
      'subject': subjectId.toString(),
    };
    await httpClient.patch('/classrooms/$classroomId?api_key=$apiKey', body: body);
  }

  @override
  Future<Subject> getSubjectById(int id) async {
    final response = await httpClient.get('/subjects/$id', queryParameters: {'api_key': apiKey});
    return SubjectModel.fromJson(jsonDecode(response.body));
  }
}
