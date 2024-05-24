import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/app_assets.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';
import 'package:hamon_machine_task/domain/entities/students_model.dart';
import 'package:hamon_machine_task/presentation/providers/student_provider.dart';
import 'package:hamon_machine_task/presentation/widgets/status_widgets.dart';
import 'package:provider/provider.dart';

class StudentDetailsScreen extends StatefulWidget {
  final int studentId;

  const StudentDetailsScreen({super.key, required this.studentId});

  @override
  State<StudentDetailsScreen> createState() => _StudentDetailsScreenState();
}

class _StudentDetailsScreenState extends State<StudentDetailsScreen> {
  @override
  void initState() {
    final provider = Provider.of<StudentProvider>(context, listen: false);
    provider.fetchStudentById(widget.studentId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(
                height: width * 0.1,
              ),
              Text(
                'Student Detail',
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
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.studentProfileImage,
                          height: 130,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          student?.name ?? 'Not Found',
                          style:
                              context.tl?.copyWith(fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Age: ${student?.age}',
                          style:
                              context.tl?.copyWith(fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(student?.email ?? 'Not Found',
                            style: context.tl?.copyWith(
                                fontSize: 17, fontWeight: FontWeight.w400)),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
