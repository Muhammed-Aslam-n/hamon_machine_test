import 'package:hamon_machine_task/domain/entities/subject_entities.dart';

abstract class SubjectRepository {
  Future<List<Subject>> getAllSubjects();
  Future<Subject> getSubjectById(int id);
}
