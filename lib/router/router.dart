import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../core/constants/app_router.dart';
import '../features/auth/presentation/pages/login_page.dart';
import '../features/auth/presentation/pages/register_page.dart';


final goRouter = GoRouter(
  initialLocation: AppRouter.login,
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
      path: AppRouter.login,
      builder: (context, state) => const LoginPage(),
    ),
    
    GoRoute(
      path: AppRouter.register,
      builder: (context, state) => const RegisterPage(),
    ),
  ],
  
  // Page d'erreur personnalisée (404)
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Text('Erreur : ${state.error}'),
    ),
  ),
);