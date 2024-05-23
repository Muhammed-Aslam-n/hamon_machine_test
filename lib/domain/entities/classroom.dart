class Classroom {
  final int id;
  final String name;
  final String layout;
  final int size;
  final String? subject;

  Classroom({
    required this.id,
    required this.name,
    required this.layout,
    required this.size,
    this.subject,
  });
}
