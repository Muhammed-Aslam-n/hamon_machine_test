import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/theme/app_theme.dart';

class AppTextStyle {
  static AppTextStyle instance = AppTextStyle();

  TextStyle displayLarge = const TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.bold,
    fontFamily: sfProDisplay,
  );
  TextStyle displayMedium = const TextStyle(
    fontSize: 45,
    fontWeight: FontWeight.bold,
    fontFamily: sfProText,
  );
  TextStyle displaySmall = const TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.bold,
    fontFamily: sfProText,
  );
  TextStyle headlineLarge = const TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    fontFamily: sfProText,
  );
  TextStyle headlineMedium = const TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    fontFamily: sfProText,
  );
  TextStyle headlineSmall = const TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    fontFamily: sfProText,
  );
  TextStyle titleLarge = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    fontFamily: sfProText,
  );
  TextStyle titleMedium = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    fontFamily: sfProText,
  );
  TextStyle titleSmall = const TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
    fontFamily: sfProText,
  );
  TextStyle labelLarge = const TextStyle(
    fontSize: 14,
    fontFamily: sfProText,
  );
  TextStyle labelMedium = const TextStyle(
    fontSize: 12,
    fontFamily: sfProText,
  );
  TextStyle labelSmall = const TextStyle(
    fontSize: 11,
    fontFamily: sfProText,
  );
  TextStyle bodyLarge = const TextStyle(
    fontSize: 16,
    fontFamily: sfProText,
  );
  TextStyle bodyMedium = const TextStyle(
    fontSize: 14,
    fontFamily: sfProText,
  );
  TextStyle bodySmall = const TextStyle(
    fontSize: 12,
    fontFamily: sfProText,
  );
}

Widget textThemeSample(BuildContext context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "displayLarge",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        Text(
          "displayMedium",
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(
          "displaySmall",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        Text(
          "headlineLarge",
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        Text(
          "headlineMedium",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Text(
          "headlineSmall",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          "titleLarge",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          "titleMedium",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          "titleSmall",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        Text(
          "labelLarge",
          style: Theme.of(context).textTheme.labelLarge,
        ),
        Text(
          "labelMedium",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Text(
          "labelSmall",
          style: Theme.of(context).textTheme.labelSmall,
        ),
        Text(
          "bodyLarge",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(
          "bodyMedium",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          "bodySmall",
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    ),
  );
}
