import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/logger.dart';
import 'package:hamon_machine_task/domain/entities/registration.dart';
import 'package:hamon_machine_task/domain/entities/students_model.dart';
import 'package:hamon_machine_task/domain/entities/subject_entities.dart';
import 'package:hamon_machine_task/domain/use_cases/add_registration.dart';
import 'package:hamon_machine_task/domain/use_cases/get_all_registrations.dart';
import 'package:hamon_machine_task/domain/use_cases/get_registration_by_id.dart';
import 'package:hamon_machine_task/domain/use_cases/remove_registration.dart';

class RegistrationProvider with ChangeNotifier {
  final GetAllRegistrations getAllRegistrations;
  final GetRegistrationById getRegistrationById;
  final AddRegistration addRegistration;
  final RemoveRegistration removeRegistration;

  RegistrationProvider({
    required this.getAllRegistrations,
    required this.getRegistrationById,
    required this.addRegistration,
    required this.removeRegistration,
  });

  List<Registration>? _registrations;
  Registration? _registration;

  List<Registration>? get registrations => _registrations;

  Registration? get registration => _registration;

  bool registrationLoading = false;
  bool registrationError = false;

  Future<void> fetchAllRegistrations() async {
    try {
      registrationLoading = true;
      registrationError = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
      _registrations = await getAllRegistrations();
      debugPrint('getAllRegistrationResponse2 ${jsonEncode(_registrations)}');

      registrationLoading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    } catch (exc, stack) {
      debugPrint('ExceptionCaughtWhileFetchingAllRegistrations $exc \n $stack');
      registrationLoading = false;
      registrationError = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }

  Student? selectedStudent;

  setSelectedStudent(Student data) {
    selectedStudent = data;
    notifyListeners();
  }

  Subject? selectedSubject;

  setSelectedSubject(Subject data) {
    selectedSubject = data;
    notifyListeners();
  }

  bool singleRegistrationLoading = false;
  bool singleRegistrationError = false;

  Future<void> fetchRegistrationById(int id) async {
    try {
      singleRegistrationLoading = true;
      singleRegistrationError = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
      _registration = await getRegistrationById(id);
      singleRegistrationLoading = false;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    } catch (exc, stack) {
      debugPrint('ExceptionCaughtWhileFetchingSpecificRegistration $exc \n $stack');
      singleRegistrationLoading = false;
      singleRegistrationError = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifyListeners();
      });
    }
  }

  Future<bool> addNewRegistration(int studentId, int subjectId) async {
    try {
      printInfo('registeringData is studentId $studentId subjectId $subjectId');
      await addRegistration(studentId, subjectId);
      await fetchAllRegistrations();
      selectedSubject = null;
      selectedStudent = null;
      notifyListeners();
      return true;
    } catch (exc, stack) {
      debugPrint('ExceptionCaughtWhileAddingNewRegistration $exc \n $stack');
      return false;
    }
  }

  Future<void> removeExistingRegistration(int id) async {
    await removeRegistration(id);
    await fetchAllRegistrations();
  }
}
