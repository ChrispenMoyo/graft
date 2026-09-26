// GRAFT Worker Shell
// Main application shell for workers with bottom navigation
// (spec §13): Home, Jobs, Messages and Profile. The worker's primary
// availability control lives on the Home screen.

import 'package:flutter/material.dart';
import '../../../core/session/session_manager.dart';
import '../../../core/widgets/graft_bottom_navigation.dart';
import '../../../features/jobs/presentation/worker/worker_jobs_screen.dart';
import '../../../features/messages/presentation/messages_screen.dart';
import '../../../features/profile/presentation/worker_profile_screen.dart';
import '../../../features/worker_home/presentation/worker_home_screen.dart';

/// Worker Shell with bottom navigation
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
        return MessagesScreen(
          isWorker: true,
          onFindWork: () => _onItemTapped(1),
        );
      case 3:
        return WorkerProfileScreen(
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
