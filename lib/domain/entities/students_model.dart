class Student {
  final int id;
  final String name;
  final String email;
  final int age;

  Student({required this.id, required this.name, required this.email, required this.age});

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      age: json['age'],
    );
  }
}