import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hamon_machine_task/core/utils/theme/app_theme.dart';

import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';
import 'package:hamon_machine_task/presentation/providers/classroom_provider.dart';
import 'package:hamon_machine_task/presentation/providers/connectivity_provider.dart';
import 'package:hamon_machine_task/presentation/providers/subject_providers.dart';
import 'package:hamon_machine_task/presentation/widgets/list_tile_widget.dart';
import 'package:hamon_machine_task/presentation/widgets/loading_overlay.dart';
import 'package:hamon_machine_task/presentation/widgets/status_widgets.dart';
import 'package:hamon_machine_task/presentation/widgets/toast.dart';
import 'package:provider/provider.dart';

class SubjectAddToClassScreen extends StatefulWidget {
  final int classroomId;

  const SubjectAddToClassScreen({super.key, required this.classroomId});

  @override
  State<SubjectAddToClassScreen> createState() =>
      _SubjectAddToClassScreenState();
}

class _SubjectAddToClassScreenState extends State<SubjectAddToClassScreen> {
  late final ClassroomProvider classroomProvider;

  @override
  void initState() {
    classroomProvider = Provider.of<ClassroomProvider>(context, listen: false);
    super.initState();
  }

  @override
  void didChangeDependencies() {
    final provider = Provider.of<SubjectProvider>(context, listen: false);
    provider.fetchAllSubjects();
    super.didChangeDependencies();
  }

  int? selectedIndex;

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
                    'Select subject',
                    style: context.tl,
                  ),
                  SizedBox(
                    height: width * 0.1,
                  ),
                  Consumer<SubjectProvider>(
                    builder: (context, subjectProvider, _) {
                      if (subjectProvider.isLoading) {
                        return const LoadingWidget();
                      }

                      if (subjectProvider.error == true) {
                        return const ErrorOccurredWidget();
                      }

                      if (subjectProvider.subjects == null) {
                        return const NoDataFoundWidget(
                          dataType: 'Subjects',
                        );
                      }

                      return Column(
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              final subject = subjectProvider.subjects?[index];
                              return ListTileWidget(
                                onTap: () {
                                  classroomProvider.setSelectedSubId(subject!.id);
                                  setState(() {
                                    selectedIndex = index;
                                  });
                                },
                                tileColor:
                                    selectedIndex == index ? greenColor : null,
                                titleItem: subject?.name,
                                subtitleItem: subject?.teacher,
                                trailingItem: Column(
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
                            separatorBuilder: (context, index) => const SizedBox(
                              height: 10,
                            ),
                            itemCount: subjectProvider.subjects!.length,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          OutlinedButton(
                            onPressed: () async {
                              if (classroomProvider.selectedSubjectId == null ||
                                  selectedIndex == null) {
                                showToast(context,
                                    'Please select any subject to proceed');
                              } else {
                                final connectivityProvider = Provider.of<ConnectivityProvider>(context,listen: false);
                                if(connectivityProvider.isConnected){
                                  LoadingScreen.instance().show(
                                      context: context,
                                      text:
                                      'Please wait, We are assigning the subject');
                                  final res = await classroomProvider.assignSubject(
                                    classroomId: widget.classroomId,
                                    subjectId: classroomProvider.selectedSubjectId!,
                                  );
                                  if (res == true&& context.mounted) {
                                    LoadingScreen.instance().hide();
                                    showToast(context, 'Subject assigned successfully',
                                        success: true);
                                    classroomProvider.fetchClassroomById(widget.classroomId);
                                    context.pop();
                                  } else if (context.mounted) {
                                    LoadingScreen.instance().hide();
                                    showToast(context, 'Some error occurred!',
                                        failure: true);
                                  }
                                }else{
                                  showToast(context, 'No network, please connect and try again',info: true);
                                }

                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 60, vertical: 15),
                              child: Text(
                                'Assign Subject',
                                style: context.ts,
                              ),
                            ),
                          ),
                        ],
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
