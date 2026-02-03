import 'package:flutter/material.dart';
import 'package:flutter_clean_archi/features/auth/presentation/pages/signup_page.dart';
import 'package:flutter_clean_archi/core/theme/app_theme.dart'; // ton fichier AppTheme avec AppColors

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const SignUpPage(),
    );
  }
}
