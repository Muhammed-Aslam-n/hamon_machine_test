import 'package:flutter/material.dart';
import 'package:hamon_machine_task/domain/entities/registration.dart';
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

  Future<void> fetchAllRegistrations() async {
    _registrations = await getAllRegistrations();
    notifyListeners();
  }

  Future<void> fetchRegistrationById(int id) async {
    _registration = await getRegistrationById(id);
    notifyListeners();
  }

  Future<void> addNewRegistration(int studentId, int subjectId) async {
    await addRegistration(studentId, subjectId);
    await fetchAllRegistrations();
  }

  Future<void> removeExistingRegistration(int id) async {
    await removeRegistration(id);
    await fetchAllRegistrations();
  }
}
