
import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/network/clients.dart';
import 'package:hamon_machine_task/core/utils/api_constants.dart';
import 'package:hamon_machine_task/data/data_sources/connectivity_data_source.dart';
import 'package:hamon_machine_task/data/repositories/classroom_repository_impl.dart';
import 'package:hamon_machine_task/data/repositories/connectivity_repository.dart';
import 'package:hamon_machine_task/data/repositories/registration_repository_impl.dart';
import 'package:hamon_machine_task/data/repositories/student_repository_impl.dart';
import 'package:hamon_machine_task/data/repositories/subject_repository_impl.dart';
import 'package:hamon_machine_task/domain/use_cases/add_registration.dart';
import 'package:hamon_machine_task/domain/use_cases/assign_subject_to_classroom.dart';
import 'package:hamon_machine_task/domain/use_cases/connectivity_service.dart';
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
import 'presentation/providers/connectivity_provider.dart';
import 'presentation/providers/registration_provider.dart';
import 'presentation/providers/student_provider.dart';
import 'presentation/providers/subject_providers.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final CustomHttpClient httpClient = CustomHttpClient(baseUrl: ApiConstants.baseUrl,);
  final studentRepository = StudentRepositoryImpl(httpClient: httpClient, apiKey: ApiConstants.apiKey);
  final subjectRepository = SubjectRepositoryImpl(httpClient: httpClient, apiKey: ApiConstants.apiKey);
  final classroomRepository = ClassroomRepositoryImpl(httpClient: httpClient, apiKey: ApiConstants.apiKey);
  final registrationRepository = RegistrationRepositoryImpl(httpClient: httpClient, apiKey: ApiConstants.apiKey);

  final connectivityDataSource = ConnectivityDataSource();
  final connectivityRepository = ConnectivityRepositoryImpl(connectivityDataSource);
  final checkConnectivity = CheckConnectivity(connectivityRepository);

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
            getSubjectById: GetSubjectById(subjectRepository)
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
        ChangeNotifierProvider(
          create: (_) => ConnectivityProvider(checkConnectivity: checkConnectivity),
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

