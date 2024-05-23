import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hamon_machine_task/core/utils/app_routes.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';
import 'package:hamon_machine_task/presentation/providers/subject_providers.dart';
import 'package:hamon_machine_task/presentation/widgets/list_tile_widget.dart';
import 'package:hamon_machine_task/presentation/widgets/status_widgets.dart';
import 'package:provider/provider.dart';
class SubjectListingScreen extends StatefulWidget {
  const SubjectListingScreen({super.key});

  @override
  State<SubjectListingScreen> createState() => _SubjectListingScreenState();
}

class _SubjectListingScreenState extends State<SubjectListingScreen> {
  @override
  void didChangeDependencies() {
    final provider = Provider.of<SubjectProvider>(context, listen: false);
    provider.fetchAllSubjects();
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

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final student = provider.subjects?[index];
                      return ListTileWidget(
                        onTap: () {
                          context
                              .pushNamed(AppRoutes.subjectDetailsScreen.name,extra: student?.id);
                        },
                        titleItem: student?.name,
                        subtitleItem: student?.teacher,
                        trailingItem: '${student?.credits}\n Credits',
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: provider.subjects!.length,
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
