import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/api_constants.dart';
import 'package:hamon_machine_task/data/repositories/classroom_repository_impl.dart';
import 'package:hamon_machine_task/data/repositories/registration_repository_impl.dart';
import 'package:hamon_machine_task/data/repositories/student_repository_impl.dart';
import 'package:hamon_machine_task/data/repositories/subject_repository_impl.dart';
import 'package:hamon_machine_task/domain/use_cases/add_registration.dart';
import 'package:hamon_machine_task/domain/use_cases/assign_subject_to_classroom.dart';
import 'package:hamon_machine_task/domain/use_cases/get_all_classrooms.dart';
import 'package:hamon_machine_task/domain/use_cases/get_all_registrations.dart';
import 'package:hamon_machine_task/domain/use_cases/get_all_students.dart';
import 'package:hamon_machine_task/domain/use_cases/get_all_subjects.dart';
import 'package:hamon_machine_task/domain/use_cases/get_classroom_by_id.dart';
import 'package:hamon_machine_task/domain/use_cases/get_registration_by_id.dart';
import 'package:hamon_machine_task/domain/use_cases/get_student_by_id.dart';
import 'package:hamon_machine_task/domain/use_cases/get_subject_by_id.dart';
import 'package:hamon_machine_task/domain/use_cases/remove_registration.dart';
import 'package:provider/provider.dart';
import 'package:hamon_machine_task/core/utils/router.dart';
import 'package:hamon_machine_task/core/utils/theme/app_theme.dart';

import 'presentation/providers/classroom_provider.dart';
import 'presentation/providers/registration_provider.dart';
import 'presentation/providers/student_provider.dart';
import 'presentation/providers/subject_providers.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Dio dio = Dio();
  final studentRepository = StudentRepositoryImpl(dio: dio, apiKey: ApiConstants.apiKey);
  final subjectRepository = SubjectRepositoryImpl(dio: dio, apiKey: ApiConstants.apiKey);
  final classroomRepository = ClassroomRepositoryImpl(dio: dio, apiKey: ApiConstants.apiKey);
  final registrationRepository = RegistrationRepositoryImpl(dio: dio, apiKey: ApiConstants.apiKey);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StudentProvider(
            getAllStudents: GetAllStudents(studentRepository),
            getStudentById: GetStudentById(studentRepository),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => SubjectProvider(
            getAllSubjects: GetAllSubjects(subjectRepository),
            getSubjectById: GetSubjectById(subjectRepository),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ClassroomProvider(
            getAllClassrooms: GetAllClassrooms(classroomRepository),
            getClassroomById: GetClassroomById(classroomRepository),
            assignSubjectToClassroom: AssignSubjectToClassroom(classroomRepository),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => RegistrationProvider(
            getAllRegistrations: GetAllRegistrations(registrationRepository),
            getRegistrationById: GetRegistrationById(registrationRepository),
            addRegistration: AddRegistration(registrationRepository),
            removeRegistration: RemoveRegistration(registrationRepository),
          ),
        ),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: AppTheme.theme,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
    );
  }
}

