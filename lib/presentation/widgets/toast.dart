
import 'package:flutter/material.dart';

showToast(
    BuildContext context,
    String message, {
      Color? messageColor,
      Color? bgColor,
      Color? textColor,
      bool info = false,
      success = false,
      failure = false,
      Duration? duration,
    }) {
  if (context.mounted) {
    final SnackBar snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(15),
        duration: duration ?? const Duration(seconds: 2),
        backgroundColor: info
            ? Colors.orange
            : success
            ? Colors.green
            : failure
            ? Colors.redAccent
            : bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Text(
          message,
          style: TextStyle(color: messageColor ?? Colors.white),
        ));
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}