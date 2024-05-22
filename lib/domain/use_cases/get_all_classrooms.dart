
import 'package:hamon_machine_task/domain/entities/classroom.dart';
import 'package:hamon_machine_task/domain/repositories/classroom_repository.dart';

class GetAllClassrooms {
  final ClassroomRepository repository;

  GetAllClassrooms(this.repository);

  Future<List<Classroom>> call() {
    return repository.getAllClassrooms();
  }
}
