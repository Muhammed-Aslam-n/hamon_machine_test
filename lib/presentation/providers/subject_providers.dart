import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/logger.dart';
import 'package:hamon_machine_task/domain/entities/subject_entities.dart';
import 'package:hamon_machine_task/domain/use_cases/get_all_subjects.dart';
import 'package:hamon_machine_task/domain/use_cases/get_subject_by_id.dart';

class SubjectProvider with ChangeNotifier {
  final GetAllSubjects getAllSubjects;
  final GetSubjectById getSubjectById;

  SubjectProvider({
    required this.getAllSubjects,
    required this.getSubjectById,
  });

  bool isLoading = false;
  bool fetchSubjectByIdLoading = false;

  bool? error;
  bool? fetchSubByIdError;

  List<Subject>? _subjects;
  Subject? _subject;

  List<Subject>? get subjects => _subjects;

  Subject? get subject => _subject;

  Future<void> fetchAllSubjects() async {
    try {
      isLoading = true;
      error = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
      _subjects = await getAllSubjects();
      isLoading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    } catch (exc, stack) {
      printError('ExceptionCaughtWhileFetchingAllSubjects $exc \n $stack');
      isLoading = false;
      isLoading = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }

  Future<void> fetchSubjectById(int id) async {
    try {
      fetchSubjectByIdLoading = true;
      fetchSubByIdError = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
      _subject = await getSubjectById(id);
      fetchSubjectByIdLoading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    } catch (exc, stack) {
      printError('ExceptionCaughtWhileFetchingSingleSubject $exc \n $stack');
      fetchSubjectByIdLoading = false;
      fetchSubByIdError = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }
}
