import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hamon_machine_task/core/utils/app_assets.dart';
import 'package:hamon_machine_task/core/utils/app_routes.dart';
import 'package:hamon_machine_task/core/utils/theme/app_theme.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';
import 'package:hamon_machine_task/presentation/widgets/fade_in_slide.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List homeScreenItems = [
    {
      "icon": AppAssets.studentIcon,
      'name': 'Students',
      'bgColor': greenColor,
    },
    {
      "icon": AppAssets.bookIcon,
      'name': 'Subjects',
      'bgColor': blueColor,
    },
    {
      "icon": AppAssets.classroomIcon,
      'name': 'Class Rooms',
      'bgColor': mildRedColor,
    },
    {
      "icon": AppAssets.registrationIcon,
      'name': 'Registration',
      'bgColor': mildYellowColor,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: width * 0.1,
            ),
            const HomeScreenWelcomeSection(),
            SizedBox(
              height: width * 0.05,
            ),
            GridView.builder(
              itemCount: homeScreenItems.length,
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2 / 2.8,
              ),
              padding: const EdgeInsets.all(10),
              itemBuilder: (itemBuilder, index) {
                return GestureDetector(
                  onTap: () => navigateToScreen(index),
                  child: FadeInSlide(
                    duration: 0.4,
                    direction: FadeSlideDirection.ltr,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: homeScreenItems[index]['bgColor'],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            homeScreenItems[index]['icon'],
                            width: 48,
                            height: 48,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            homeScreenItems[index]['name'],
                            style: context.tm,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  void navigateToScreen(int index) {
    switch (index) {
      case 0:
        context.pushNamed(AppRoutes.studentsListingScreen.name);
        break;
      case 1:
        context.pushNamed(AppRoutes.subjectsListingScreen.name);
        break;
      case 2:
        context.pushNamed(AppRoutes.classroomListingScreen.name);
        break;
      case 3:
        context.pushNamed(AppRoutes.registeredStudentDataScreen.name);
        break;
    }
  }
}

class HomeScreenWelcomeSection extends StatelessWidget {
  const HomeScreenWelcomeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: context.dm
                    ?.copyWith(fontSize: 28, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 8,
              ),
              Text('Good Morning',
                  style: context.dm
                      ?.copyWith(fontSize: 22, fontWeight: FontWeight.w400)),
            ],
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu))
        ],
      ),
    );
  }
}
