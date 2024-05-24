import 'package:flutter/material.dart';

import 'package:hamon_machine_task/core/utils/app_assets.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';
import 'package:hamon_machine_task/domain/entities/subject_entities.dart';
import 'package:hamon_machine_task/presentation/providers/connectivity_provider.dart';
import 'package:hamon_machine_task/presentation/providers/subject_providers.dart';
import 'package:hamon_machine_task/presentation/widgets/status_widgets.dart';
import 'package:provider/provider.dart';

class SubjectDetailsScreen extends StatefulWidget {
  final int subjectId;

  const SubjectDetailsScreen({super.key, required this.subjectId});

  @override
  State<SubjectDetailsScreen> createState() => _SubjectDetailsScreenState();
}

class _SubjectDetailsScreenState extends State<SubjectDetailsScreen> {
  @override
  void initState() {
    final provider = Provider.of<SubjectProvider>(context, listen: false);
    provider.fetchSubjectById(widget.subjectId);
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
                    height: width * 0.07,
                  ),
                  Text(
                    'Subject Detail',
                    style: context.tl,
                  ),
                  SizedBox(
                    height: width * 0.1,
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
                      return Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            SizedBox(
                              height: width * 0.18,
                            ),
                            Image.asset(
                              AppAssets.subjectCoverImage,
                              height: 130,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              subject?.name ?? 'Not Found',
                              style:
                                  context.tl?.copyWith(fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              subject?.teacher ?? 'Not Found',
                              style: context.tl?.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Credit : ${subject?.credits}',
                              style:
                                  context.tl?.copyWith(fontWeight: FontWeight.w400,fontSize: 17,),
                            ),
                          ],
                        ),
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
