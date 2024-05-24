import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/theme/text_style_ext.dart';

class RegistrationActionButton extends StatelessWidget {
  final String action;
  final Color bgColor,textColor;
  final VoidCallback onTap;
  const RegistrationActionButton({super.key, required this.action, required this.bgColor, required this.textColor, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),

      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          backgroundColor: bgColor,
        ),
        child: Text(
          action,
          style: context.tm?.copyWith(
            color: textColor,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
