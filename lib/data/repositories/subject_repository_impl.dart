
import 'package:dio/dio.dart';
import 'package:hamon_machine_task/data/models/subject_model.dart';
import 'package:hamon_machine_task/domain/entities/subject_entities.dart';
import 'package:hamon_machine_task/domain/repositories/subject_repository.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  final Dio dio;
  final String apiKey;

  SubjectRepositoryImpl({required this.dio, required this.apiKey});

  @override
  Future<List<Subject>> getAllSubjects() async {
    final response = await dio.get('/subjects', queryParameters: {'api_key': apiKey});
    final subjects = (response.data['subjects'] as List).map((json) => SubjectModel.fromJson(json)).toList();
    return subjects;
  }

  @override
  Future<Subject> getSubjectById(int id) async {
    final response = await dio.get('/subjects/$id', queryParameters: {'api_key': apiKey});
    return SubjectModel.fromJson(response.data);
  }
}
