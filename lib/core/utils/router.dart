import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:hamon_machine_task/core/utils/app_routes.dart';
import 'package:hamon_machine_task/presentation/screens/classroom/classroom_details_screen.dart';
import 'package:hamon_machine_task/presentation/screens/classroom/classroom_listing_screen.dart';
import 'package:hamon_machine_task/presentation/screens/classroom/subject_add_to_class_screen.dart';
import 'package:hamon_machine_task/presentation/screens/classroom/subject_change_for_classroom_screen.dart';
import 'package:hamon_machine_task/presentation/screens/home/home_screen.dart';
import 'package:hamon_machine_task/presentation/screens/launch/launch_screen.dart';
import 'package:hamon_machine_task/presentation/screens/registration/new_registration_screen.dart';
import 'package:hamon_machine_task/presentation/screens/registration/registered_stu_data_screen.dart';
import 'package:hamon_machine_task/presentation/screens/registration/registered_user_screen.dart';
import 'package:hamon_machine_task/presentation/screens/registration/select_student_for_reg_screen.dart';
import 'package:hamon_machine_task/presentation/screens/registration/select_sub_for_reg_screen.dart';
import 'package:hamon_machine_task/presentation/screens/student/student_details_screen.dart';
import 'package:hamon_machine_task/presentation/screens/student/student_listing_screen.dart';
import 'package:hamon_machine_task/presentation/screens/subject/subject_details_screen.dart';
import 'package:hamon_machine_task/presentation/screens/subject/subject_listing_screen.dart';

/// Router configuration for application.
/// Whenever new views added, it should be configured here clearly.

final router = GoRouter(
  initialLocation: AppRoutes.launchScreen.path,
  routes: [
    GoRoute(
      path: AppRoutes.launchScreen.path,
      name: AppRoutes.launchScreen.name,
      builder: (context, state) => const LaunchScreen(),
    ),
    GoRoute(
      path: AppRoutes.homeScreen.path,
      name: AppRoutes.homeScreen.name,
      pageBuilder: (context, state) => const CupertinoPage(
        child: HomeScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.studentsListingScreen.path,
      name: AppRoutes.studentsListingScreen.name,
      pageBuilder: (context, state) => const CupertinoPage(
        child: StudentListingScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.studentDetailsScreen.path,
      name: AppRoutes.studentDetailsScreen.name,
      pageBuilder: (context, state) => CupertinoPage(
        child: StudentDetailsScreen(studentId: state.extra as int,),
      ),
    ),
    GoRoute(
      path: AppRoutes.subjectsListingScreen.path,
      name: AppRoutes.subjectsListingScreen.name,
      pageBuilder: (context, state) => const CupertinoPage(
        child: SubjectListingScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.subjectDetailsScreen.path,
      name: AppRoutes.subjectDetailsScreen.name,
      builder: (context, state) => const SubjectDetailsScreen(),
    ),
    GoRoute(
      path: AppRoutes.classroomListingScreen.path,
      name: AppRoutes.classroomListingScreen.name,
      pageBuilder: (context, state) => const CupertinoPage(
        child: ClassroomListingScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.classroomDetailsScreen.path,
      name: AppRoutes.classroomDetailsScreen.name,
      pageBuilder: (context, state) => const CupertinoPage(
        child: ClassroomDetailsScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.subjectChangeForClassScreen.path,
      name: AppRoutes.subjectChangeForClassScreen.name,
      pageBuilder: (context, state) => const CupertinoPage(
        child: SubjectChangeForClassroomScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.subjectAddToClassScreen.path,
      name: AppRoutes.subjectAddToClassScreen.name,
      pageBuilder: (context, state) => const CupertinoPage(
        child: SubjectAddToClassScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.registeredUsersScreen.path,
      name: AppRoutes.registeredUsersScreen.name,
      pageBuilder: (context, state) => const CupertinoPage(
        child: RegisteredUsersScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.newRegistrationScreen.path,
      name: AppRoutes.newRegistrationScreen.name,
      pageBuilder: (context, state) => const CupertinoPage(
        child: NewRegistrationScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.selectStudentForRegScreen.path,
      name: AppRoutes.selectStudentForRegScreen.name,
      pageBuilder: (context, state) => const CupertinoPage(
        child: SelectStudentForRegScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.selectSubjectForRegScreen.path,
      name: AppRoutes.selectSubjectForRegScreen.name,
      pageBuilder: (context, state) => const CupertinoPage(
        child: SelectSubjectForRegistrationScreen(),
      ),
    ),
    GoRoute(
      path: AppRoutes.registeredStudentDataScreen.path,
      name: AppRoutes.registeredStudentDataScreen.name,
      pageBuilder: (context, state) => const CupertinoPage(
        child: RegisteredStudentDataScreen(),
      ),
    ),
  ],
);
