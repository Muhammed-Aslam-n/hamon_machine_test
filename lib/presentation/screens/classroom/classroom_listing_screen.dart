import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hamon_machine_task/core/utils/app_routes.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';
import 'package:hamon_machine_task/presentation/providers/classroom_provider.dart';
import 'package:hamon_machine_task/presentation/widgets/list_tile_widget.dart';
import 'package:hamon_machine_task/presentation/widgets/status_widgets.dart';
import 'package:provider/provider.dart';

class ClassroomListingScreen extends StatefulWidget {
  const ClassroomListingScreen({super.key});

  @override
  State<ClassroomListingScreen> createState() => _ClassroomListingScreenState();
}

class _ClassroomListingScreenState extends State<ClassroomListingScreen> {
  @override
  void didChangeDependencies() {
    final provider = Provider.of<ClassroomProvider>(context, listen: false);
    provider.fetchAllClassrooms();
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
                height: width * 0.08,
              ),
              Text(
                'Class Rooms',
                style: context.tl,
              ),
              SizedBox(
                height: width * 0.1,
              ),
              Consumer<ClassroomProvider>(
                builder: (context, provider, _) {
                  if (provider.isLoading) {
                    return const LoadingWidget();
                  }

                  if (provider.error == true) {
                    return const ErrorOccurredWidget();
                  }

                  if (provider.classrooms == null) {
                    return const NoDataFoundWidget(
                      dataType: 'Classrooms',
                    );
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final classroom = provider.classrooms?[index];
                      return ListTileWidget(
                        onTap: () {
                          context.pushNamed(
                            AppRoutes.classroomDetailsScreen.name,
                            extra: classroom,
                          );
                        },
                        titleItem: classroom?.name,
                        subtitleItem: classroom?.layout,
                        trailingItem: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              classroom?.size.toString() ?? '0',
                              style: context.lm?.copyWith(fontSize: 13),
                            ),
                            Text(
                              'Seats',
                              style: context.lm?.copyWith(fontSize: 13),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: provider.classrooms!.length,
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
