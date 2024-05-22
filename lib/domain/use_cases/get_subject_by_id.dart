
import 'package:hamon_machine_task/domain/entities/subject_entities.dart';
import 'package:hamon_machine_task/domain/repositories/subject_repository.dart';

class GetSubjectById {
  final SubjectRepository repository;

  GetSubjectById(this.repository);

  Future<Subject> call(int id) {
    return repository.getSubjectById(id);
  }
}
