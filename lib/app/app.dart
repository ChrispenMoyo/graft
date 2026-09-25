// GRAFT App Entry Point
// Main application widget

import 'package:flutter/material.dart';
import 'package:graft/core/theme/app_theme.dart';
import 'package:graft/features/home/presentation/home_screen.dart';
import 'package:graft/features/onboarding/presentation/onboarding_screen.dart';
import 'package:graft/features/auth/presentation/login_screen.dart';
import 'package:graft/apps/customer/presentation/customer_shell.dart';
import 'package:graft/apps/worker/presentation/worker_shell.dart';

class GRAFTApp extends StatelessWidget {
  const GRAFTApp({super.key});

  /// Generate routes for the app
  static Route<dynamic> _generateRoute(RouteSettings settings) {
    Widget pageBuilder;

    switch (settings.name) {
      case '/':
        pageBuilder = const HomeScreen();
        break;
      case '/onboarding':
        pageBuilder = const OnboardingScreen();
        break;
      case '/login':
        pageBuilder = const LoginScreen();
        break;
      case '/home':
        pageBuilder = const HomeScreen();
        break;
      case '/customer':
        pageBuilder = const CustomerShell();
        break;
      case '/worker':
        pageBuilder = const WorkerShell();
        break;
      default:
        pageBuilder = const HomeScreen();
    }

    return MaterialPageRoute(
      builder: (_) => pageBuilder,
      settings: settings,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GRAFT Zimbabwe',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: '/onboarding',
      onGenerateRoute: _generateRoute,
    );
  }
}