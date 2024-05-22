import 'package:flutter/material.dart';
import 'package:hamon_machine_task/domain/entities/classroom.dart';
import 'package:hamon_machine_task/domain/use_cases/assign_subject_to_classroom.dart';
import 'package:hamon_machine_task/domain/use_cases/get_all_classrooms.dart';
import 'package:hamon_machine_task/domain/use_cases/get_classroom_by_id.dart';
class ClassroomProvider with ChangeNotifier {
  final GetAllClassrooms getAllClassrooms;
  final GetClassroomById getClassroomById;
  final AssignSubjectToClassroom assignSubjectToClassroom;

  ClassroomProvider({
    required this.getAllClassrooms,
    required this.getClassroomById,
    required this.assignSubjectToClassroom,
  });

  List<Classroom>? _classrooms;
  Classroom? _classroom;

  List<Classroom>? get classrooms => _classrooms;
  Classroom? get classroom => _classroom;

  Future<void> fetchAllClassrooms() async {
    _classrooms = await getAllClassrooms();
    notifyListeners();
  }

  Future<void> fetchClassroomById(int id) async {
    _classroom = await getClassroomById(id);
    notifyListeners();
  }

  Future<void> assignSubject(int classroomId, int subjectId) async {
    await assignSubjectToClassroom(classroomId, subjectId);
    await fetchClassroomById(classroomId);
  }
}
