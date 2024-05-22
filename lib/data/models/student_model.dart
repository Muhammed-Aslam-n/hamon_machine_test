
import 'package:hamon_machine_task/domain/entities/students_model.dart';

class StudentModel extends Student {
  StudentModel({
    required super.id,
    required super.name,
    required super.email,
    required super.age,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      age: json['age'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
    };
  }
}
