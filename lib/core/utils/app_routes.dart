class Route {
  String path;
  String name;

  Route({
    required this.path,
    required this.name,
  });
}

class AppRoutes {
  AppRoutes._();

  static Route launchScreen = Route(path: '/launch', name: 'launch');
  static Route homeScreen = Route(path: '/homeScreen', name: 'homeScreen');
  static Route studentsListingScreen =
      Route(path: '/studentListing', name: 'studentListing');
  static Route studentDetailsScreen =
      Route(path: '/studentDetails', name: 'studentDetails');
  static Route subjectsListingScreen =
      Route(path: '/subjectsListing', name: 'subjectsListing');
  static Route subjectDetailsScreen =
      Route(path: '/subjectDetails', name: 'subjectDetails');
  static Route classroomListingScreen =
      Route(path: '/classroomListing', name: 'classroomListing');
  static Route classroomDetailsScreen =
      Route(path: '/classroomDetails', name: 'classroomDetails');
  static Route subjectChangeForClassScreen =
      Route(path: '/subjectChangeForClass', name: 'subjectChangeForClass');
  static Route subjectAddToClassScreen =
      Route(path: '/subjectAddToClass', name: 'subjectAddToClass');
  static Route registeredUsersDataScreen =
      Route(path: '/registeredUsers', name: 'registeredUsers');
  static Route newRegistrationScreen =
      Route(path: '/newRegistration', name: 'newRegistration');
  static Route selectStudentForRegScreen =
      Route(path: '/selectStudentForReg', name: 'selectStudentForReg');
  static Route selectSubjectForRegScreen =
      Route(path: '/selectSubjectForReg', name: 'selectSubjectForReg');
  static Route registrationScreen =
      Route(path: '/registrationScreen', name: 'registrationScreen');
  static Route registeredStudentDataScreen =
      Route(path: '/registeredStudentData', name: 'registeredStudentData');
// static Route Screen = Route(path: '/', name: '');
// static Route Screen = Route(path: '/', name: '');
// static Route Screen = Route(path: '/', name: '');
// static Route Screen = Route(path: '/', name: '');
}
