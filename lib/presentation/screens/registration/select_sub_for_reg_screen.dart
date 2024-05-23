import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hamon_machine_task/core/utils/app_routes.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';
import 'package:hamon_machine_task/presentation/providers/registration_provider.dart';
import 'package:hamon_machine_task/presentation/providers/subject_providers.dart';
import 'package:hamon_machine_task/presentation/widgets/list_tile_widget.dart';
import 'package:hamon_machine_task/presentation/widgets/status_widgets.dart';
import 'package:provider/provider.dart';


class SelectSubjectForRegistrationScreen extends StatefulWidget {
  const SelectSubjectForRegistrationScreen({super.key});

  @override
  State<SelectSubjectForRegistrationScreen> createState() => _SelectSubjectForRegistrationScreenState();
}

class _SelectSubjectForRegistrationScreenState extends State<SelectSubjectForRegistrationScreen> {

  late final RegistrationProvider regProvider;
  @override
  void initState() {
    final provider = Provider.of<SubjectProvider>(context, listen: false);
    regProvider = Provider.of<RegistrationProvider>(context, listen: false);
    provider.fetchAllSubjects();
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
                height: width * 0.08,
              ),
              Text(
                'Subjects',
                style: context.tl,
              ),
              SizedBox(
                height: width * 0.1,
              ),
              Consumer<SubjectProvider>(
                builder: (context, provider, _) {
                  if (provider.isLoading) {
                    return const LoadingWidget();
                  }
                  if (provider.error == true) {
                    return const ErrorOccurredWidget();
                  }
                  if (provider.subjects == null) {
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
                          final subject = provider.subjects?[index];
                          return ListTileWidget(
                            onTap: () {
                              regProvider.setSelectedSubject(subject!);
                              context.pop();
                            },
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
                        itemCount: provider.subjects!.length,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
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
