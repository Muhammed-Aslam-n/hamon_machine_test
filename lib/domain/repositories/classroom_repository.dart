
import 'package:hamon_machine_task/domain/entities/classroom.dart';
import 'package:hamon_machine_task/domain/entities/subject_entities.dart';

abstract class ClassroomRepository {
  Future<List<Classroom>> getAllClassrooms();
  Future<Classroom> getClassroomById(int id);
  Future<void> assignSubjectToClassroom(int classroomId, int subjectId);
  Future<Subject> getSubjectById(int id);
}
