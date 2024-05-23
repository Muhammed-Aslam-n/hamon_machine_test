import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hamon_machine_task/core/network/clients.dart';
import 'package:hamon_machine_task/data/models/registration_model.dart';
import 'package:hamon_machine_task/domain/entities/registration.dart';
import 'package:hamon_machine_task/domain/repositories/registration_repository.dart';

class RegistrationRepositoryImpl implements RegistrationRepository {
  final CustomHttpClient httpClient;
  final String apiKey;

  RegistrationRepositoryImpl({required this.httpClient, required this.apiKey});

  @override
  Future<List<Registration>> getAllRegistrations() async {
    final response = await httpClient.get('/registration', queryParameters: {'api_key': apiKey});
    debugPrint('getAllRegistrationResponse ${jsonDecode(response.body)}');
    final registrations = (jsonDecode(response.body)['registrations'] as List).map((json) => RegistrationModel.fromJson(json)).toList();
    return registrations;
  }

  @override
  Future<Registration> getRegistrationById(int id) async {
    final response = await httpClient.get('/registration/$id', queryParameters: {'api_key': apiKey});
    return RegistrationModel.fromJson(jsonDecode(response.body));
  }

  @override
  Future<void> addRegistration(int studentId, int subjectId) async {
    await httpClient.post('/registration', body:'student=$studentId&subject=$subjectId');
  }

  @override
  Future<void> removeRegistration(int id) async {
    await httpClient.delete('/registration/$id', headers: {'api_key': apiKey});
  }
}
