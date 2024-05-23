import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hamon_machine_task/core/utils/app_routes.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';
import 'package:hamon_machine_task/presentation/providers/student_provider.dart';
import 'package:hamon_machine_task/presentation/widgets/list_tile_widget.dart';
import 'package:hamon_machine_task/presentation/widgets/status_widgets.dart';
import 'package:provider/provider.dart';

class StudentListingScreen extends StatefulWidget {
  const StudentListingScreen({super.key});

  @override
  State<StudentListingScreen> createState() => _StudentListingScreenState();
}

class _StudentListingScreenState extends State<StudentListingScreen> {
  @override
  void didChangeDependencies() {
    final provider = Provider.of<StudentProvider>(context, listen: false);
    provider.fetchAllStudents();
    super.didChangeDependencies();
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
                'Students',
                style: context.tl,
              ),
              SizedBox(
                height: width * 0.1,
              ),
              Consumer<StudentProvider>(
                builder: (context, provider, _) {
                  if (provider.isLoading) {
                    return const LoadingWidget();
                  }

                  if (provider.error == true) {
                    return const ErrorOccurredWidget();
                  }

                  if (provider.students == null) {
                    return const NoDataFoundWidget(
                      dataType: 'Student',
                    );
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final student = provider.students?[index];
                      return ListTileWidget(
                        onTap: () {
                          context
                              .pushNamed(AppRoutes.studentDetailsScreen.name,extra: student?.id);
                        },
                        titleItem: student?.name,
                        subtitleItem: student?.email,
                        trailingItem: 'Age: ${student?.age}',
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: provider.students!.length,
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
