// GRAFT Customer Shell
// Main application shell for customers with bottom navigation
// Provides navigation between Home, Jobs, Post, and Profile

import 'package:flutter/material.dart';
import '../../../core/design_tokens/design_tokens.dart';
import '../../../core/session/session_manager.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/graft_bottom_navigation.dart';
import '../../../core/widgets/snackbar.dart';
import '../../../features/customer_home/presentation/customer_home_screen.dart';
import '../../../features/jobs/presentation/customer/customer_jobs_container.dart';
import '../../../features/jobs/presentation/post_job/post_job_flow.dart';

/// Customer Shell with bottom navigation
/// Provides the main navigation structure for customer functionality
class CustomerShell extends StatefulWidget {
  const CustomerShell({super.key});

  @override
  State<CustomerShell> createState() => _CustomerShellState();
}

class _CustomerShellState extends State<CustomerShell> {
  int _selectedIndex = 0;

  /// Bumped whenever job data may have changed (job posted) or when a data
  /// tab becomes visible, so tab screens reload instead of showing stale
  /// data from when the shell first built them.
  int _dataVersion = 0;

  void _onItemTapped(int index) {
    if (index != _selectedIndex && (index == 0 || index == 1)) {
      _dataVersion++;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onJobPosted() {
    // Return to home after posting and refresh data everywhere
    if (mounted) {
      setState(() {
        _dataVersion++;
        _selectedIndex = 0;
      });
      GraftSnackbar.showSuccess(context, 'Your job has been posted');
    }
  }

  Widget _buildTab(int index) {
    switch (index) {
      case 0:
        return CustomerHomeScreen(
          dataVersion: _dataVersion,
          onViewAllJobs: () => _onItemTapped(1),
        );
      case 1:
        return CustomerJobsContainer(
          key: ValueKey(_dataVersion),
          onNewJob: () => _onItemTapped(2),
        );
      case 2:
        // Post tab - shows the post job flow
        return PostJobFlow(
          onJobPosted: _onJobPosted,
        );
      case 3:
        // Profile tab placeholder
        return _ProfilePlaceholder(
          onSignOut: _signOut,
        );
      default:
        return CustomerHomeScreen(
          dataVersion: _dataVersion,
          onViewAllJobs: () => _onItemTapped(1),
        );
    }
  }

  /// Clears the session and returns to the role selection screen
  void _signOut() {
    SessionManager.instance.clearSession();
    Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    // Each tab screen owns its own AppBar; the shell only provides
    // the body and bottom navigation.
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: List.generate(4, _buildTab),
      ),
      bottomNavigationBar: GraftBottomNavigation(
        selectedIndex: _selectedIndex,
        onItemSelected: _onItemTapped,
        type: GraftNavigationType.customer,
      ),
    );
  }
}

/// Profile placeholder screen for customer
class _ProfilePlaceholder extends StatelessWidget {
  final VoidCallback? onSignOut;

  const _ProfilePlaceholder({
    this.onSignOut,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(GraftSpacing.lg),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_outline,
              size: GraftIcon.xxl,
              color: GraftColors.textMuted,
            ),
            const SizedBox(height: GraftSpacing.xl),
            Text(
              'Profile',
              style: GraftTypography.headlineLarge,
            ),
            const SizedBox(height: GraftSpacing.lg),
            Text(
              'Profile and account settings will be available in a later GRAFT release.',
              style: GraftTypography.bodyMedium.copyWith(
                color: GraftColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: GraftSpacing.xl),
            SecondaryButton(
              text: 'Sign out',
              onPressed: onSignOut,
            ),
          ],
        ),
      ),
    );
  }
}
