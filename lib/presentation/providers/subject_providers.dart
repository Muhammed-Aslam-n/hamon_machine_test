import 'package:flutter/material.dart';
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

  List<Subject>? _subjects;
  Subject? _subject;

  List<Subject>? get subjects => _subjects;
  Subject? get subject => _subject;

  Future<void> fetchAllSubjects() async {
    _subjects = await getAllSubjects();
    notifyListeners();
  }

  Future<void> fetchSubjectById(int id) async {
    _subject = await getSubjectById(id);
    notifyListeners();
  }
}
