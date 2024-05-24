import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/logger.dart';
import 'package:hamon_machine_task/domain/entities/classroom.dart';
import 'package:hamon_machine_task/domain/entities/subject_entities.dart';
import 'package:hamon_machine_task/domain/use_cases/assign_subject_to_classroom.dart';
import 'package:hamon_machine_task/domain/use_cases/get_all_classrooms.dart';
import 'package:hamon_machine_task/domain/use_cases/get_classroom_by_id.dart';
import 'package:hamon_machine_task/domain/use_cases/get_subject_by_id.dart';

class ClassroomProvider with ChangeNotifier {
  final GetAllClassrooms getAllClassrooms;
  final GetClassroomById getClassroomById;
  final AssignSubjectToClassroom assignSubjectToClassroom;
  final GetSubjectById getSubjectById;

  ClassroomProvider({
    required this.getAllClassrooms,
    required this.getClassroomById,
    required this.assignSubjectToClassroom,
    required this.getSubjectById,
  });

  bool isLoading = false;
  bool fetchClassroomByIdLoading = false;

  bool? error;
  bool? fetchClassByIdError;

  List<Classroom>? _classrooms;
  Classroom? _classroom;

  List<Classroom>? get classrooms => _classrooms;

  Classroom? get classroom => _classroom;

  Future<void> fetchAllClassrooms() async {
    try {
      isLoading = true;
      error = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
      _classrooms = await getAllClassrooms();
      isLoading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    } catch (exc, stack) {
      printError('ExceptionCaughtWhileFetchingAllClassrooms $exc \n $stack');
      isLoading = false;
      error = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }


  Future<void> fetchClassroomById(int id) async {
    try {
      fetchClassroomByIdLoading = true;
      fetchClassByIdError = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
      _classroom = await getClassroomById(id);
      if (classroom?.subject != 'null' &&
          classroom!.subject!.isNotEmpty){
        fetchSubjectById(int.parse(classroom!.subject!));
      }
      fetchClassroomByIdLoading = false;
      notifyListeners();
    } catch (exc, stack) {
      printError(
          'ExceptionCaughtWhileFetchingSpecificClassrooms $exc \n $stack');
      fetchClassroomByIdLoading = false;
      fetchClassByIdError = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }

  int? selectedSubjectId;

  setSelectedSubId(id) {
    selectedSubjectId = id;
    notifyListeners();
  }

  Future<bool> assignSubject(
      {required int classroomId, required int subjectId}) async {
    try {
      debugPrint(
          'addingClassDetails ID: $classroomId and subjectID is $subjectId');
      await assignSubjectToClassroom(classroomId, subjectId);
      selectedSubjectId = null;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
      return true;
    } catch (exc, stack) {
      debugPrint('ExceptionCaughtWhileAssigningSubToClassroom $exc \n $stack');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
      return false;
    }
  }

  Subject? _subject;

  Subject? get subject => _subject;

  Future<void> fetchSubjectById(int id) async {
    try {
      debugPrint('fetchSubByIdInClassroom $id');
      _subject = await getSubjectById(id);
      notifyListeners();
    } catch (exc, stack) {
      debugPrint('ExceptionCaughtWhileFetchingSingleStudent $exc \n $stack');
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }
}
