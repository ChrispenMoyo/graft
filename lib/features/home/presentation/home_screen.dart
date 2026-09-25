// GRAFT Home Screen
// Main landing page for both customers and workers

import 'package:flutter/material.dart';
import '../../../core/design_tokens/design_tokens.dart';
import '../../../core/widgets/graft_logo.dart';

enum UserRoleType { customer, worker }

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _onSelectRole(UserRoleType role) {
    // Navigate to the appropriate shell based on role
    if (role == UserRoleType.customer) {
      Navigator.of(context).pushReplacementNamed('/customer');
    } else {
      Navigator.of(context).pushReplacementNamed('/worker');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const GraftLogo(
          size: 24,
          color: GraftColors.white,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.of(context).pushReplacementNamed('/login'),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(GraftSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Welcome to GRAFT',
                style: GraftTypography.headlineLarge.copyWith(
                  color: GraftColors.textPrimary,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Zimbabwe's hyperlocal services marketplace",
                style: GraftTypography.bodyMedium.copyWith(
                  color: GraftColors.textSecondary,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                'Select your role:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _RoleCard(
                      title: 'Customer',
                      subtitle: 'Post jobs and find workers',
                      icon: Icons.home_work,
                      onTap: () => _onSelectRole(UserRoleType.customer),
                    ),
                    _RoleCard(
                      title: 'Worker',
                      subtitle: 'Find nearby jobs',
                      icon: Icons.work,
                      onTap: () => _onSelectRole(UserRoleType.worker),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const _RoleCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: GraftElevation.level1,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(GraftSpacing.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: GraftIcon.lg, color: GraftColors.primary),
              const SizedBox(height: GraftSpacing.sm),
              Text(
                title,
                style: GraftTypography.headlineMedium.copyWith(
                  color: GraftColors.textPrimary,
                ),
              ),
              const SizedBox(height: GraftSpacing.xs),
              Text(
                subtitle,
                textAlign: TextAlign.center,
                maxLines: 2,
                style: GraftTypography.bodyMedium.copyWith(
                  color: GraftColors.textSecondary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}