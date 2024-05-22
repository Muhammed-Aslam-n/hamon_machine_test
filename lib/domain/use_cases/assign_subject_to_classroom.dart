
import 'package:hamon_machine_task/domain/repositories/classroom_repository.dart';

class AssignSubjectToClassroom {
  final ClassroomRepository repository;

  AssignSubjectToClassroom(this.repository);

  Future<void> call(int classroomId, int subjectId) {
    return repository.assignSubjectToClassroom(classroomId, subjectId);
  }
}
