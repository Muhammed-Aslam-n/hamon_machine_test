import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';

class RegistrationDetailsTile extends StatelessWidget {
  final String title,subtitle1,subtitle2;
  final Widget trailing;
  const RegistrationDetailsTile({super.key, required this.title, required this.subtitle1, required this.subtitle2, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      title: Text(
        title,
        style: context.tm
            ?.copyWith(fontSize: 17, fontWeight: FontWeight.w400),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Text(
            subtitle1,
            style: context.tm?.copyWith(
                fontSize: 13, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            subtitle2,
            style: context.tm?.copyWith(
                fontSize: 13, fontWeight: FontWeight.w400),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
      trailing: trailing
    );
  }
}
