
import 'package:hamon_machine_task/domain/entities/subject_entities.dart';
import 'package:hamon_machine_task/domain/repositories/subject_repository.dart';

class GetAllSubjects {
  final SubjectRepository repository;

  GetAllSubjects(this.repository);

  Future<List<Subject>> call() {
    return repository.getAllSubjects();
  }
}
