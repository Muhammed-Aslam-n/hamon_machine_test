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

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool? _error;

  bool? get error => _error;

  List<Subject>? _subjects;
  Subject? _subject;

  List<Subject>? get subjects => _subjects;

  Subject? get subject => _subject;

  Future<void> fetchAllSubjects() async {
    try {
      _isLoading = true;
      _error = false;
      notifyListeners();
      _subjects = await getAllSubjects();
      _isLoading = false;
      notifyListeners();
    } catch (exc, stack) {
      printError('ExceptionCaughtWhileFetchingAllSubjects $exc \n $stack');
      _isLoading = false;
      _error = true;
      notifyListeners();
    }
  }

  Future<void> fetchSubjectById(int id) async {
    try {
      _isLoading = true;
      _error = false;
      notifyListeners();
      _subject = await getSubjectById(id);
      _isLoading = false;
      notifyListeners();
    } catch (exc, stack) {
      printError('ExceptionCaughtWhileFetchingSingleSubject $exc \n $stack');
      _isLoading = false;
      _error = true;
      notifyListeners();
    }
  }
}
