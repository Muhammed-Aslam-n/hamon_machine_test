
import 'package:hamon_machine_task/domain/entities/classroom.dart';

class ClassroomModel extends Classroom {
  ClassroomModel({
    required super.id,
    required super.name,
    required super.layout,
    required super.size,
    super.subject,
  });

  factory ClassroomModel.fromJson(Map<String, dynamic> json) {
    return ClassroomModel(
      id: json['id'],
      name: json['name'],
      layout: json['layout'],
      size: json['size'],
      subject: json['subject'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'layout': layout,
      'size': size,
      'subject': subject,
    };
  }
}
