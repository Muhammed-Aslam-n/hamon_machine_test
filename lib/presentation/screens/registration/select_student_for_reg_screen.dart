import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';
import 'package:hamon_machine_task/presentation/providers/registration_provider.dart';
import 'package:hamon_machine_task/presentation/providers/student_provider.dart';
import 'package:hamon_machine_task/presentation/widgets/list_tile_widget.dart';
import 'package:hamon_machine_task/presentation/widgets/status_widgets.dart';
import 'package:provider/provider.dart';

import '../../providers/connectivity_provider.dart';

class SelectStudentForRegScreen extends StatefulWidget {
  const SelectStudentForRegScreen({super.key});

  @override
  State<SelectStudentForRegScreen> createState() =>
      _SelectStudentForRegScreenState();
}

class _SelectStudentForRegScreenState extends State<SelectStudentForRegScreen> {

  late final RegistrationProvider regProvider;

  @override
  void initState() {
    final provider = Provider.of<StudentProvider>(context, listen: false);
    regProvider = Provider.of<RegistrationProvider>(context, listen: false);
    provider.fetchAllStudents();
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
          child: Consumer<ConnectivityProvider>(
              builder: (context,connectivity,_) {
                if(!connectivity.isConnected){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: width*0.6,),
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
                              regProvider.setSelectedStudent(student!);
                              context.pop();
                            },
                            titleItem: student?.name,
                            subtitleItem: student?.email,
                            trailingItem: Text(
                              'Age: ${student?.age}',
                              style: context.lm?.copyWith(fontSize: 17),
                            ),
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
              );
            }
          ),
        ),
      ),
    );
  }
}
