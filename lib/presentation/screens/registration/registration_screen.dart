import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hamon_machine_task/core/utils/app_routes.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';
import 'package:hamon_machine_task/presentation/providers/registration_provider.dart';
import 'package:hamon_machine_task/presentation/widgets/list_tile_widget.dart';
import 'package:hamon_machine_task/presentation/widgets/registration_action_button.dart';
import 'package:hamon_machine_task/presentation/widgets/status_widgets.dart';
import 'package:provider/provider.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  void initState() {
    final provider = Provider.of<RegistrationProvider>(context, listen: false);
    provider.fetchAllRegistrations();
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
                'Registration',
                style: context.tl,
              ),
              SizedBox(
                height: width * 0.1,
              ),
              Consumer<RegistrationProvider>(
                builder: (context, provider, _) {
                  if (provider.registrationLoading) {
                    return const LoadingWidget();
                  }
                  if (provider.registrationError == true) {
                    return const ErrorOccurredWidget();
                  }
                  if (provider.registrations == null) {
                    return const NoDataFoundWidget(
                      dataType: 'Registrations',
                    );
                  }

                  return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final registration = provider.registrations?[index];

                      return ListTileWidget(
                        onTap: () {
                          context.pushNamed(
                            AppRoutes.registeredStudentDataScreen.name,
                            extra: registration,
                          );
                        },
                        titleItem:
                            "Registration Id: #${registration?.id.toString()}",
                        subtitleItem: '',
                        showSubtitle: false,
                        padding: 15,
                        trailingItem: const Icon(Icons.chevron_right),
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemCount: provider.registrations!.length,
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: RegistrationActionButton(
        onTap: () {
          context.pushNamed(AppRoutes.newRegistrationScreen.name);
        },
        action: 'New Registration',
        bgColor: const Color(0xFF007AFF).withOpacity(0.3).withAlpha(50),
        textColor: const Color(0xFF007AFF),
      ),
    );
  }
}
