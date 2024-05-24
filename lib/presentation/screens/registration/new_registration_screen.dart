// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hamon_machine_task/core/utils/app_routes.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';
import 'package:hamon_machine_task/presentation/providers/connectivity_provider.dart';
import 'package:hamon_machine_task/presentation/providers/registration_provider.dart';
import 'package:hamon_machine_task/presentation/widgets/list_tile_widget.dart';
import 'package:hamon_machine_task/presentation/widgets/loading_overlay.dart';
import 'package:hamon_machine_task/presentation/widgets/toast.dart';
import 'package:provider/provider.dart';

class NewRegistrationScreen extends StatefulWidget {
  const NewRegistrationScreen({super.key});

  @override
  State<NewRegistrationScreen> createState() => _NewRegistrationScreenState();
}

class _NewRegistrationScreenState extends State<NewRegistrationScreen> {
  late final RegistrationProvider provider;

  @override
  void initState() {
    provider = Provider.of<RegistrationProvider>(context, listen: false);
    provider.getAllRegistrations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: width * 0.08,
              ),
              Text(
                'Registration',
                style: context.tl,
              ),
              SizedBox(
                height: width * 0.1,
              ),
              Consumer<RegistrationProvider>(
                builder: (context, provider, _) {
                  return Column(
                    children: [
                      if (provider.selectedStudent != null)
                        ListTileWidget(
                          onTap: () {},
                          titleItem:
                              provider.selectedStudent?.name ?? 'Not found',
                          subtitleItem:
                              provider.selectedStudent?.email ?? 'Not found',
                          trailingItem: Text(
                            'Age: ${provider.selectedStudent?.age}',
                            style: context.lm?.copyWith(fontSize: 17),
                          ),
                        )
                      else
                        ListTileWidget(
                          onTap: () {
                            context.pushNamed(
                              AppRoutes.selectStudentForRegScreen.name,
                            );
                          },
                          titleItem: 'Select a student',
                          padding: 10,
                          subtitleItem: '',
                          showSubtitle: false,
                          trailingItem: const Icon(Icons.chevron_right),
                        ),
                      const SizedBox(
                        height: 20,
                      ),
                      if (provider.selectedSubject != null)
                        ListTileWidget(
                          onTap: () {},
                          titleItem:
                              provider.selectedSubject?.name ?? 'Not found',
                          subtitleItem:
                              provider.selectedSubject?.teacher ?? 'Not found',
                          trailingItem: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                provider.selectedSubject?.credits.toString() ??
                                    '0',
                                style: context.lm?.copyWith(fontSize: 13),
                              ),
                              Text(
                                'Credits',
                                style: context.lm?.copyWith(fontSize: 13),
                              ),
                            ],
                          ),
                        )
                      else
                        ListTileWidget(
                          onTap: () {
                            context.pushNamed(
                              AppRoutes.selectSubjectForRegScreen.name,
                            );
                          },
                          titleItem: 'Select a subject',
                          padding: 10,
                          subtitleItem: '',
                          showSubtitle: false,
                          trailingItem: const Icon(Icons.chevron_right),
                        ),
                      SizedBox(
                        height: width * 0.2,
                      ),
                      OutlinedButton(
                        onPressed: () async {
                          if (provider.selectedStudent != null &&
                              provider.selectedSubject != null) {
                            await completeNewRegistration(
                              provider.selectedStudent!.id,
                              provider.selectedSubject!.id,
                            );
                          }else if (provider.selectedSubject == null) {
                            showToast(context, 'Select a subject to proceed', info: true);
                          } else {
                            showToast(context, 'Select a student to proceed', info: true);
                          }
                        },
                        style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFF0FAB76),
                            fixedSize: const Size.fromHeight(48)),
                        child: Text(
                          'Register',
                          style: context.tm
                              ?.copyWith(color: Colors.white, fontSize: 17),
                        ),
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

  Future completeNewRegistration(int studentId, int subjectId) async {
    final connectivityProvider = Provider.of<ConnectivityProvider>(context,listen: false);
    if(connectivityProvider.isConnected){
      LoadingScreen.instance().show(
          context: context, text: 'Please wait, Completing your registration');
      final res = await provider.addNewRegistration(studentId, subjectId);
      if (res == true && context.mounted) {
        LoadingScreen.instance().hide();
        showToast(context, 'Registered successfully', success: true);
        context.pop();
      } else if (context.mounted) {
        LoadingScreen.instance().hide();
      }
    }else{
      showToast(context, 'No network, please connect and try again',info: true);
    }

  }
}
