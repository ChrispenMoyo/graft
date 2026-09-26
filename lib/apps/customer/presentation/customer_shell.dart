// GRAFT Customer Shell
// Main application shell for customers with bottom navigation
// (spec §13): Home, Jobs, Messages and Profile, with the primary
// "+ Post Job" action raised in the middle of the bar.

import 'package:flutter/material.dart';
import '../../../core/session/session_manager.dart';
import '../../../core/widgets/graft_bottom_navigation.dart';
import '../../../core/widgets/snackbar.dart';
import '../../../features/customer_home/presentation/customer_home_screen.dart';
import '../../../features/jobs/presentation/customer/customer_jobs_container.dart';
import '../../../features/jobs/presentation/post_job/post_job_flow.dart';
import '../../../features/messages/presentation/messages_screen.dart';
import '../../../features/profile/presentation/customer_profile_screen.dart';

/// Customer Shell with bottom navigation
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

  /// Opens the Post Job flow on top of the shell
  void _openPostJob() {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            settings: const RouteSettings(name: '/post-job'),
            builder: (context) => PostJobFlow(
              onJobPosted: () {
                if (!mounted) return;
                GraftSnackbar.showSuccess(context, 'Your job has been posted');
                setState(() {
                  _dataVersion++;
                  _selectedIndex = 1;
                });
              },
            ),
          ),
        )
        .then((_) {
          // Data may have changed even when the flow was closed early
          if (mounted) setState(() => _dataVersion++);
        });
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
          onNewJob: _openPostJob,
        );
      case 2:
        return MessagesScreen(
          isWorker: false,
          onPostJob: _openPostJob,
        );
      case 3:
        return CustomerProfileScreen(
          onSignOut: _signOut,
          dataVersion: _dataVersion,
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
        onCenterAction: _openPostJob,
      ),
    );
  }
}
