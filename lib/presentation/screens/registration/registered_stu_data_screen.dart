import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';
import 'package:hamon_machine_task/domain/entities/registration.dart';
import 'package:hamon_machine_task/domain/entities/students_model.dart';
import 'package:hamon_machine_task/domain/entities/subject_entities.dart';
import 'package:hamon_machine_task/presentation/providers/connectivity_provider.dart';
import 'package:hamon_machine_task/presentation/providers/registration_provider.dart';
import 'package:hamon_machine_task/presentation/providers/student_provider.dart';
import 'package:hamon_machine_task/presentation/providers/subject_providers.dart';
import 'package:hamon_machine_task/presentation/widgets/loading_overlay.dart';
import 'package:hamon_machine_task/presentation/widgets/registration_action_button.dart';
import 'package:hamon_machine_task/presentation/widgets/registration_details_tile.dart';
import 'package:hamon_machine_task/presentation/widgets/status_widgets.dart';
import 'package:hamon_machine_task/presentation/widgets/toast.dart';
import 'package:provider/provider.dart';

class RegisteredStudentDataScreen extends StatefulWidget {
  final Registration registrationData;

  const RegisteredStudentDataScreen(
      {super.key, required this.registrationData});

  @override
  State<RegisteredStudentDataScreen> createState() =>
      _RegisteredStudentDataScreenState();
}

class _RegisteredStudentDataScreenState
    extends State<RegisteredStudentDataScreen> {
  @override
  void initState() {
    final provider = Provider.of<StudentProvider>(context, listen: false);
    provider.fetchStudentById(widget.registrationData.studentId);
    final provider2 = Provider.of<SubjectProvider>(context, listen: false);
    provider2.fetchSubjectById(widget.registrationData.subjectId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Consumer<ConnectivityProvider>(
              builder: (context, connectivity, _) {
            if (!connectivity.isConnected) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: width * 0.6,
                  ),
                  const NoNetworkWidget(),
                ],
              );
            }
            return Column(
              children: [
                SizedBox(
                  height: width * 0.08,
                ),
                Text(
                  'Registration',
                  style: context.tl,
                ),
                SizedBox(
                  height: width * 0.1,
                ),
                Consumer<StudentProvider>(
                  builder: (context, provider, _) {
                    if (provider.fetchStudentByIdLoading) {
                      return const LoadingWidget();
                    }

                    if (provider.fetchStudentByIdError == true) {
                      return const ErrorOccurredWidget();
                    }

                    if (provider.student == null) {
                      return const NoDataFoundWidget(
                        dataType: 'Student',
                      );
                    }
                    final Student? student = provider.student;
                    return RegistrationDetailsTile(
                      title: 'Student details',
                      subtitle1: student?.name ?? 'Not found',
                      subtitle2: student?.email ?? 'Not found',
                      trailing: Text(
                        'Age: ${student?.age}',
                        style: context.lm?.copyWith(fontSize: 17),
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Consumer<SubjectProvider>(
                  builder: (context, provider, _) {
                    if (provider.fetchSubjectByIdLoading) {
                      return const LoadingWidget();
                    }

                    if (provider.fetchSubByIdError == true) {
                      return const ErrorOccurredWidget();
                    }

                    if (provider.subject == null) {
                      return const NoDataFoundWidget(
                        dataType: 'Subject',
                      );
                    }
                    final Subject? subject = provider.subject;
                    return RegistrationDetailsTile(
                      title: 'Subject details',
                      subtitle1: subject?.name ?? 'Not found',
                      subtitle2: subject?.teacher ?? 'Not found',
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            subject?.credits.toString() ?? '0',
                            style: context.lm?.copyWith(fontSize: 13),
                          ),
                          Text(
                            'Credits',
                            style: context.lm?.copyWith(fontSize: 13),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            );
          }),
        ),
      ),
      bottomNavigationBar: RegistrationActionButton(
        onTap: () async {
          showDialog(
            context: context,
            builder: (builder) => CupertinoAlertDialog(
              title: const Text('Delete'),
              content: const Text('Do you want to delete'),
              actions: [
                TextButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: Text(
                    'No',
                    style: context.tm?.copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    removeExistingReg();
                    context.pop();
                  },
                  child: Text(
                    'Yes',
                    style: context.tm?.copyWith(
                      color: Colors.blue,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        action: 'Delete Registration',
        bgColor: const Color(0xFFF9614F),
        textColor: Colors.white,
      ),
    );
  }

  void removeExistingReg() async {
    final connectivityProvider =
        Provider.of<ConnectivityProvider>(context, listen: false);
    if (connectivityProvider.isConnected) {
      LoadingScreen.instance().show(
          context: context, text: 'Please wait, removing the registration');
      final regProvider =
          Provider.of<RegistrationProvider>(context, listen: false);
      final res = await regProvider
          .removeExistingRegistration(widget.registrationData.id);

      if (res == true && context.mounted) {
        LoadingScreen.instance().hide();
        context.pop();
        showToast(context, 'Registration deleted', success: true);
      } else {
        LoadingScreen.instance().hide();
        showToast(context, 'Some error occurred!', failure: true);
      }
    } else {
      showToast(context, 'No network, please connect and try again',
          info: true);
    }
  }
}
