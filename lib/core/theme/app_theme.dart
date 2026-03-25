import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

class AppTheme {
  AppTheme._();

  static InputDecorationTheme _inputDecoration(Brightness brightness) {
    final primaryColor = AppColors.get('primary', brightness: brightness);
    final errorColor = AppColors.get('error', brightness: brightness);
    final subTextColor = AppColors.get('subText', brightness: brightness);

    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.get('background', brightness: brightness),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: subTextColor.withValues(alpha: 0.3)),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: errorColor),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(color: errorColor, width: 2),
      ),

      floatingLabelStyle: TextStyle(
        color: subTextColor,
      ),

      hintStyle: TextStyle(color: subTextColor.withValues(alpha: 0.6),fontSize: 18),
      labelStyle: TextStyle(color: subTextColor),
      errorStyle: TextStyle(color: errorColor, fontWeight: FontWeight.w500),
    );
  }

  //----------------------------------------------------------------------------
  // Light Theme
  //----------------------------------------------------------------------------
  static ThemeData light = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.get(
      'background',
      brightness: Brightness.light,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.get('appBar', brightness: Brightness.light),
      foregroundColor: AppColors.get('text', brightness: Brightness.light),
      elevation: 0,
    ),

    colorScheme: ColorScheme.light(
      primary: AppColors.get('primary', brightness: Brightness.light),
      secondary: AppColors.get('secondary', brightness: Brightness.light),
      tertiary: AppColors.get('tertiary', brightness: Brightness.light),
      surface: AppColors.get('background', brightness: Brightness.light),
      onSurface: AppColors.get('icon',brightness: Brightness.light),
      error: AppColors.get('error', brightness: Brightness.light),
      outline: AppColors.get('subText',brightness: Brightness.light,).withValues(alpha: 0.5),
    ),

    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 42,fontWeight: FontWeight.bold,color: AppColors.get('text', brightness: Brightness.light),),
      bodyLarge: TextStyle(fontSize: 18,color: AppColors.get('text', brightness: Brightness.light),),
      bodyMedium: TextStyle(fontSize: 16,color: AppColors.get('text', brightness: Brightness.light),),
      bodySmall: TextStyle(fontSize: 14,color: AppColors.get('subText', brightness: Brightness.light),),
    ),

    iconTheme: IconThemeData(
      color: AppColors.get('icon', brightness: Brightness.light),
    ),

    inputDecorationTheme: _inputDecoration(Brightness.light),
  );

  //----------------------------------------------------------------------------
  // Dark Theme
  //----------------------------------------------------------------------------
  static ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.get(
      'background',
      brightness: Brightness.dark,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.get('appBar', brightness: Brightness.dark),
      foregroundColor: AppColors.get('text', brightness: Brightness.dark),
      elevation: 0,
    ),

    colorScheme: ColorScheme.dark(
      primary: AppColors.get('primary', brightness: Brightness.dark),
      secondary: AppColors.get('secondary', brightness: Brightness.dark),
      tertiary: AppColors.get('tertiary', brightness: Brightness.dark),
      surface: AppColors.get('background', brightness: Brightness.dark),
      error: AppColors.get('error', brightness: Brightness.dark),
      outline: AppColors.get(
        'subText',
        brightness: Brightness.dark,
      ).withValues(alpha: 0.5),
    ),

    textTheme: TextTheme(
      displayLarge: TextStyle(fontSize: 42,fontWeight: FontWeight.bold,color: AppColors.get('text', brightness: Brightness.dark),),
      bodyLarge: TextStyle(fontSize:18, color: AppColors.get('text', brightness: Brightness.dark),),
      bodyMedium: TextStyle( fontSize:16, color: AppColors.get('text', brightness: Brightness.dark),),
      bodySmall: TextStyle( fontSize:14, color: AppColors.get('subText', brightness: Brightness.dark),),
    ),

    iconTheme: IconThemeData(
      color: AppColors.get('icon', brightness: Brightness.dark),
    ),

    inputDecorationTheme: _inputDecoration(Brightness.dark),
  );
}
