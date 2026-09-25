// GRAFT Bottom Navigation Component
// Reusable bottom navigation bar for Customer and Worker shells

import 'package:flutter/material.dart';
import '../design_tokens/design_tokens.dart';

/// Navigation destination for bottom navigation
class GraftNavigationDestination {
  final String id;
  final String label;
  final IconData icon;
  final IconData activeIcon;

  const GraftNavigationDestination({
    required this.id,
    required this.label,
    required this.icon,
    IconData? activeIcon,
  }) : activeIcon = activeIcon ?? icon;
}

/// Bottom navigation types by user role
enum GraftNavigationType {
  /// Customer navigation: Home, Jobs, Post, Profile
  customer,
  /// Worker navigation: Home, Jobs, Work, Profile
  worker,
}

/// GRAFT Reusable Bottom Navigation
/// Supports both Customer and Worker navigation patterns
class GraftBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final GraftNavigationType type;

  const GraftBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    this.type = GraftNavigationType.customer,
  });

  /// Get destinations based on navigation type
  List<GraftNavigationDestination> get _destinations {
    switch (type) {
      case GraftNavigationType.customer:
        return _customerDestinations;
      case GraftNavigationType.worker:
        return _workerDestinations;
    }
  }

  static final List<GraftNavigationDestination> _customerDestinations = [    GraftNavigationDestination(
      id: 'home',
      label: 'Home',
      icon: Icons.home,
    ),
    GraftNavigationDestination(
      id: 'jobs',
      label: 'Jobs',
      icon: Icons.work,
    ),
    GraftNavigationDestination(
      id: 'post',
      label: 'Post',
      icon: Icons.add,
    ),
    GraftNavigationDestination(
      id: 'profile',
      label: 'Profile',
      icon: Icons.person,
    ),
  ];

  static final List<GraftNavigationDestination> _workerDestinations = [
    GraftNavigationDestination(
      id: 'home',
      label: 'Home',
      icon: Icons.home,
    ),
    GraftNavigationDestination(
      id: 'jobs',
      label: 'Jobs',
      icon: Icons.work,
    ),
    GraftNavigationDestination(
      id: 'work',
      label: 'Work',
      icon: Icons.build,
    ),
    GraftNavigationDestination(
      id: 'profile',
      label: 'Profile',
      icon: Icons.person,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) => onItemSelected(index),
      items: _destinations.map((destination) {
        return BottomNavigationBarItem(
          icon: Icon(
            destination.icon,
            size: GraftIcon.md,
            color: GraftColors.textSecondary,
          ),
          activeIcon: Icon(
            destination.activeIcon,
            size: GraftIcon.md,
            color: GraftColors.primary,
          ),
          label: destination.label,
        );
      }).toList(),
      selectedItemColor: GraftColors.primary,
      unselectedItemColor: GraftColors.textSecondary,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 8,
    );
  }
}