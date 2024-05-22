import 'package:hamon_machine_task/domain/entities/registration.dart';

class RegistrationModel extends Registration {
  RegistrationModel({
    required super.id,
    required super.studentId,
    required super.subjectId,
  });

  factory RegistrationModel.fromJson(Map<String, dynamic> json) {
    return RegistrationModel(
      id: json['id'],
      studentId: json['student'],
      subjectId: json['subject'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'student': studentId,
      'subject': subjectId,
    };
  }
}
