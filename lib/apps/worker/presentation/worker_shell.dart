// GRAFT Worker Shell
// Main application shell for workers with bottom navigation
// Provides navigation between Home, Jobs, Work, and Profile

import 'package:flutter/material.dart';
import '../../../core/design_tokens/design_tokens.dart';
import '../../../core/session/session_manager.dart';
import '../../../core/widgets/graft_bottom_navigation.dart';
import '../../../core/widgets/snackbar.dart';
import '../../../core/widgets/buttons.dart';
import '../../../features/jobs/presentation/post_job/post_job_flow.dart';
import '../../../features/jobs/presentation/worker/worker_jobs_screen.dart';
import '../../../features/worker_home/presentation/worker_home_screen.dart';
/// Worker Shell with bottom navigation
/// Provides the main navigation structure for worker functionality
class WorkerShell extends StatefulWidget {
  const WorkerShell({super.key});

  @override
  State<WorkerShell> createState() => _WorkerShellState();
}

class _WorkerShellState extends State<WorkerShell> {
  int _selectedIndex = 0;

  /// Bumped when a data tab becomes visible or a job is posted, so tab
  /// screens reload instead of showing stale data.
  int _dataVersion = 0;

  void _onItemTapped(int index) {
    if (index != _selectedIndex && (index == 0 || index == 1)) {
      _dataVersion++;
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildTab(int index) {
    switch (index) {
      case 0:
        return WorkerHomeScreen(
          dataVersion: _dataVersion,
          onViewAllJobs: () => _onItemTapped(1),
        );
      case 1:
        return WorkerJobsScreen(
          key: ValueKey(_dataVersion),
        );
      case 2:
        // Work tab - post a job CTA and active work
        return _WorkTab(
          onJobPosted: () {
            if (mounted) {
              setState(() {
                _dataVersion++;
                _selectedIndex = 1;
              });
              GraftSnackbar.showSuccess(context, 'Your job has been posted');
            }
          },
        );
      case 3:
        return _ProfilePlaceholder(
          onSignOut: _signOut,
        );
      default:
        return WorkerHomeScreen(
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
        type: GraftNavigationType.worker,
      ),
    );
  }
}

/// Work tab for Worker with Post a Job CTA and active work
class _WorkTab extends StatelessWidget {
  final VoidCallback onJobPosted;

  const _WorkTab({
    required this.onJobPosted,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Work'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(GraftSpacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.build_outlined,
                size: GraftIcon.xxl,
                color: GraftColors.textMuted,
              ),
              const SizedBox(height: GraftSpacing.xl),
              Text(
                'Your active work will appear here.',
                style: GraftTypography.bodyMedium.copyWith(
                  color: GraftColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: GraftSpacing.xl),
              Text(
                'Offering your services on a job is coming in a later GRAFT release.',
                style: GraftTypography.bodySmall.copyWith(
                  color: GraftColors.textMuted,
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              PrimaryButton(
                onPressed: () {
                  // Open the shared PostJobFlow
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      settings: const RouteSettings(name: '/post-job'),
                      builder: (context) => PostJobFlow.fromSession(
                        onJobPosted: onJobPosted,
                        role: 'Worker',
                      ),
                    ),
                  );
                },
                text: 'Post a Job',
              ),
              const SizedBox(height: GraftSpacing.lg),
            ],
          ),
        ),
      ),
    );
  }
}

/// Profile placeholder for Worker
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
