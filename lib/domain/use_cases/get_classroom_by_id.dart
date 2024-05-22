
import 'package:hamon_machine_task/domain/entities/classroom.dart';
import 'package:hamon_machine_task/domain/repositories/classroom_repository.dart';

class GetClassroomById {
  final ClassroomRepository repository;

  GetClassroomById(this.repository);

  Future<Classroom> call(int id) {
    return repository.getClassroomById(id);
  }
}
