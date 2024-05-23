import 'package:flutter/material.dart';
import 'package:hamon_machine_task/core/utils/theme/app_textsyle.dart';

const greenColor = Color(0xFFAAC9BF);
const blueColor = Color(0xFFD8EBFD);
const mildRedColor = Color(0xFFFFE0DD);
const mildYellowColor = Color(0xFFFFF3D9);

const sfProText = 'SFProTextRegular';
const sfProDisplay = 'SFProDisplayRegular';

class AppTheme {
  static final AppTextStyle _textStyle = AppTextStyle.instance;
  static const Color primaryColor = Color(0xFFD1D1D1);

  static ThemeData get theme {
    return ThemeData(
      primaryColor: greenColor,
      scaffoldBackgroundColor: const Color(0xFFf5f9fa),
      appBarTheme: const AppBarTheme(color: Color(0xFFf5f9fa)),
      listTileTheme: ListTileThemeData(
        tileColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      textTheme: TextTheme(
        displayLarge: _textStyle.displayLarge,
        displayMedium: _textStyle.displayMedium,
        displaySmall: _textStyle.displaySmall,
        headlineLarge: _textStyle.headlineLarge,
        headlineMedium: _textStyle.headlineMedium,
        headlineSmall: _textStyle.headlineSmall,
        titleLarge: _textStyle.titleLarge,
        titleSmall: _textStyle.titleSmall,
        titleMedium: _textStyle.titleMedium,
        labelLarge: _textStyle.labelLarge,
        labelMedium: _textStyle.labelMedium,
        labelSmall: _textStyle.labelSmall,
        bodyLarge: _textStyle.bodyLarge,
        bodyMedium: _textStyle.bodyMedium,
        bodySmall: _textStyle.bodySmall,
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: greenColor,
          fixedSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          side: BorderSide.none,
          backgroundColor: greenColor,
          textStyle: TextStyle(
            color: Colors.green,
          ),
        ),
      ),
    );
  }
}
