
import 'package:hamon_machine_task/domain/entities/subject_entities.dart';

class SubjectModel extends Subject {
  SubjectModel({
    required super.id,
    required super.name,
    required super.credits,
    required super.teacher,
  });

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      id: json['id'],
      name: json['name'],
      credits: json['credits'],
      teacher: json['teacher'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'credits': credits,
      'teacher': teacher,
    };
  }
}
