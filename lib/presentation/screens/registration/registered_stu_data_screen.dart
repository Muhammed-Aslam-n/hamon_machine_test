import 'package:flutter/material.dart';

class RegisteredStudentDataScreen extends StatefulWidget {
  const RegisteredStudentDataScreen({super.key});

  @override
  State<RegisteredStudentDataScreen> createState() => _RegisteredStudentDataScreenState();
}

class _RegisteredStudentDataScreenState extends State<RegisteredStudentDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text('Registration'),
          ],
        ),
      ),
    );
  }
}
