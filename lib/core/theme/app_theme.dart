import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  //----------------------------------------------------------------------------
  // Light Theme
  //----------------------------------------------------------------------------
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.get('background', brightness: Brightness.light),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.get('appBar', brightness: Brightness.light),
      foregroundColor: AppColors.get('text', brightness: Brightness.light),
      elevation: 0,
    ),

    colorScheme: ColorScheme.light(
      primary: AppColors.get('primary', brightness: Brightness.light),
      secondary: AppColors.get('secondary', brightness: Brightness.light),
      surface: AppColors.get('background', brightness: Brightness.light),
      error: AppColors.get('error', brightness: Brightness.light),
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.get('text', brightness: Brightness.light)),
      bodyMedium: TextStyle(color: AppColors.get('text', brightness: Brightness.light)),
      bodySmall: TextStyle(color: AppColors.get('subText', brightness: Brightness.light)),
    ),

    iconTheme: IconThemeData(
      color: AppColors.get('icon', brightness: Brightness.light),
    ),
  );

  //----------------------------------------------------------------------------
  // Dark Theme
  //----------------------------------------------------------------------------
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.get('background', brightness: Brightness.dark),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.get('appBar', brightness: Brightness.dark),
      foregroundColor: AppColors.get('text', brightness: Brightness.dark),
      elevation: 0,
    ),

    colorScheme: ColorScheme.dark(
      primary: AppColors.get('primary', brightness: Brightness.dark),
      secondary: AppColors.get('secondary', brightness: Brightness.dark),
      surface: AppColors.get('background', brightness: Brightness.dark),
      error: AppColors.get('error', brightness: Brightness.dark),
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.get('text', brightness: Brightness.dark)),
      bodyMedium: TextStyle(color: AppColors.get('text', brightness: Brightness.dark)),
      bodySmall: TextStyle(color: AppColors.get('subText', brightness: Brightness.dark)),
    ),

    iconTheme: IconThemeData(
      color: AppColors.get('icon', brightness: Brightness.dark),
    ),
  );
}
