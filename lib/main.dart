import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_blog/core/di/service_locator.dart';
import 'package:rick_blog/features/auth/presentation/blocs/register/bloc/register_bloc.dart';
import 'package:rick_blog/router/router.dart'; 
import 'package:rick_blog/core/theme/app_theme.dart';
import 'package:rick_blog/core/di/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<RegisterBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. On utilise le constructeur .router
    return MaterialApp.router(
      title: 'Blog App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      
      // 2. On remplace 'home' par 'routerConfig'
      // 'goRouter' est la variable que tu as créée dans ton fichier router.dart
      routerConfig: goRouter, 
    );
  }
}