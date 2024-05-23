import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hamon_machine_task/core/utils/app_assets.dart';
import 'package:hamon_machine_task/core/utils/app_routes.dart';

import 'package:hamon_machine_task/core/utils/theme/app_theme.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';
import 'package:hamon_machine_task/domain/entities/classroom.dart';
import 'package:hamon_machine_task/presentation/providers/classroom_provider.dart';
import 'package:hamon_machine_task/presentation/widgets/status_widgets.dart';
import 'package:provider/provider.dart';

class ClassroomDetailsScreen extends StatefulWidget {
  final Classroom classroomData;

  const ClassroomDetailsScreen({super.key, required this.classroomData});

  @override
  State<ClassroomDetailsScreen> createState() => _ClassroomDetailsScreenState();
}

class _ClassroomDetailsScreenState extends State<ClassroomDetailsScreen> {
  late final ClassroomProvider provider;

  @override
  void initState() {
    provider = Provider.of<ClassroomProvider>(context, listen: false);
    provider.fetchClassroomById(widget.classroomData.id);
    super.initState();
    debugPrint('classroomEntityData ${jsonEncode(widget.classroomData)}');
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
                height: width * 0.07,
              ),
              Text(
                widget.classroomData.name.isNotEmpty
                    ? widget.classroomData.name
                    : 'Not Found',
                style: context.tl,
              ),
              SizedBox(
                height: width * 0.1,
              ),
              Consumer<ClassroomProvider>(
                builder: (context, provider, _) {
                  if (provider.fetchClassroomByIdLoading) {
                    return const LoadingWidget();
                  }
                  if (provider.fetchClassByIdError == true) {
                    return const ErrorOccurredWidget();
                  }
                  if (provider.classroom == null) {
                    return const NoDataFoundWidget(
                      dataType: 'Classroom',
                    );
                  }
                  final Classroom classroom = provider.classroom!;
                  debugPrint('classRoomParsedInDetails ${jsonEncode(classroom)}');
                  return Container(
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        if (classroom.subject == null ||
                            classroom.subject == 'null' ||
                            classroom.subject!.isEmpty)
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  'Add Subject',
                                  style: context.ts?.copyWith(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const Spacer(),
                                OutlinedButton(
                                  onPressed: () {
                                    addNewSubToClassFn(classroom.id);
                                  },
                                  child: Text(
                                    'Add',
                                    style: context.ts
                                        ?.copyWith(color: Colors.green),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        if (classroom.subject != 'null' &&
                            classroom.subject!.isNotEmpty)
                          Container(
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Text(
                                  provider.subject?.name ??
                                      'No subject found',
                                  style: context.ts?.copyWith(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ), 
                                const Spacer(),
                                OutlinedButton(
                                  onPressed: () {
                                    addNewSubToClassFn(classroom.id);
                                  },
                                  child: Text(
                                    'Change',
                                    style: context.ts
                                        ?.copyWith(color: Colors.green),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        SizedBox(
                          height: width * 0.05,
                        ),
                        if (classroom.layout.toLowerCase() == 'classroom')
                          GridView.builder(
                            shrinkWrap: true,
                            itemCount: 32,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(14),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: classroom.size > index
                                        ? greenColor
                                        : Colors.black,
                                  ),
                                ),
                                padding: const EdgeInsets.all(10),
                                child: Image.asset(
                                  AppAssets.chairLeftIcon,
                                  height: 24,
                                ),
                              );
                            },
                          ),
                        if (classroom.layout.toLowerCase() == 'conference')
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: 10,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                int seatNumberLeft = index * 2 + 1;
                                int seatNumberRight = index * 2 + 2;

                                // Calculate the total number of occupied seats for this pair
                                int totalOccupiedSeats = classroom
                                    .size; // Get total occupied seats from your API;

                                // Determine if the current seats are occupied
                                bool isLeftSeatOccupied =
                                    seatNumberLeft <= totalOccupiedSeats;
                                bool isRightSeatOccupied =
                                    seatNumberRight <= totalOccupiedSeats;

                                // Use the occupied status to determine the color
                                Color leftSeatColor = isLeftSeatOccupied
                                    ? greenColor
                                    : AppTheme.primaryColor;
                                Color rightSeatColor = isRightSeatOccupied
                                    ? greenColor
                                    : AppTheme.primaryColor;

                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppAssets.chairLeftIcon,
                                      color: leftSeatColor,
                                      height: 24,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Container(
                                      height: 60,
                                      width: width * 0.4,
                                      color: AppTheme.primaryColor,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Image.asset(
                                      AppAssets.chairRightIcon,
                                      color: rightSeatColor,
                                      height: 24,
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        SizedBox(
                          height: width * 0.2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            seatIndicator(),
                            const SizedBox(
                              width: 40,
                            ),
                            seatIndicator(assigned: false),
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
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

  addNewSubToClassFn(int classId) {
    context.pushNamed(AppRoutes.subjectAddToClassScreen.name, extra: classId);
  }

  Row seatIndicator({bool assigned = true}) {
    return Row(
      children: [
        Container(
          height: 15,
          width: 15,
          color: assigned ? greenColor : Colors.black,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(assigned ? 'Assigned seats' : 'Unassigned seats'),
      ],
    );
  }
}
