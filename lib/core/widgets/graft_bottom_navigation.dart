// GRAFT Bottom Navigation Component
// Primary navigation for the Customer and Worker shells (spec §13):
//   Customer: Home, Jobs, [ + Post Job ], Messages, Profile
//   Worker:   Home, Jobs, Messages, Profile
// The customer's primary action (+ Post Job) sits raised in the middle
// of the bar, within thumb reach, instead of being a fifth tab.

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
  /// Customer navigation: Home, Jobs, [+ Post], Messages, Profile
  customer,
  /// Worker navigation: Home, Jobs, Messages, Profile
  worker,
}

/// GRAFT Reusable Bottom Navigation
/// Supports both Customer and Worker navigation patterns
class GraftBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemSelected;
  final GraftNavigationType type;

  /// Shown when the customer taps the raised centre action
  final VoidCallback? onCenterAction;

  const GraftBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onItemSelected,
    this.type = GraftNavigationType.customer,
    this.onCenterAction,
  });

  List<GraftNavigationDestination> get _destinations {
    switch (type) {
      case GraftNavigationType.customer:
        return _customerDestinations;
      case GraftNavigationType.worker:
        return _workerDestinations;
    }
  }

  bool get _hasCenterAction => type == GraftNavigationType.customer;

  static const List<GraftNavigationDestination> _customerDestinations = [
    GraftNavigationDestination(id: 'home', label: 'Home', icon: Icons.home_outlined, activeIcon: Icons.home),
    GraftNavigationDestination(id: 'jobs', label: 'Jobs', icon: Icons.work_outline, activeIcon: Icons.work),
    GraftNavigationDestination(id: 'messages', label: 'Messages', icon: Icons.chat_bubble_outline, activeIcon: Icons.chat_bubble),
    GraftNavigationDestination(id: 'profile', label: 'Profile', icon: Icons.person_outline, activeIcon: Icons.person),
  ];

  static const List<GraftNavigationDestination> _workerDestinations = [
    GraftNavigationDestination(id: 'home', label: 'Home', icon: Icons.home_outlined, activeIcon: Icons.home),
    GraftNavigationDestination(id: 'jobs', label: 'Jobs', icon: Icons.work_outline, activeIcon: Icons.work),
    GraftNavigationDestination(id: 'messages', label: 'Messages', icon: Icons.chat_bubble_outline, activeIcon: Icons.chat_bubble),
    GraftNavigationDestination(id: 'profile', label: 'Profile', icon: Icons.person_outline, activeIcon: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    final destinations = _destinations;
    // With a centre action, the tabs are split around it: the first
    // half on the left, the second half on the right.
    final splitIndex = _hasCenterAction
        ? (destinations.length / 2).ceil()
        : destinations.length;
    final leftItems = destinations.sublist(0, splitIndex);
    final rightItems = destinations.sublist(splitIndex);

    return Container(
      decoration: BoxDecoration(
        color: GraftColors.surface,
        border: Border(
          top: BorderSide(color: GraftColors.surfaceVariant, width: 1),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 64,
          child: Row(
            children: [
              for (final destination in leftItems)
                _NavItem(
                  destination: destination,
                  selected: destinations.indexOf(destination) == selectedIndex,
                  onTap: () => onItemSelected(destinations.indexOf(destination)),
                ),
              if (_hasCenterAction)
                _CenterPostAction(onTap: onCenterAction),
              for (final destination in rightItems)
                _NavItem(
                  destination: destination,
                  selected: destinations.indexOf(destination) == selectedIndex,
                  onTap: () => onItemSelected(destinations.indexOf(destination)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A single navigation item in the bottom bar
class _NavItem extends StatelessWidget {
  final GraftNavigationDestination destination;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = selected ? GraftColors.primary : GraftColors.textSecondary;

    return Expanded(
      child: Semantics(
        button: true,
        selected: selected,
        label: destination.label,
        child: InkWell(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                selected ? destination.activeIcon : destination.icon,
                size: GraftIcon.md,
                color: color,
              ),
              const SizedBox(height: 2),
              Text(
                destination.label,
                style: TextStyle(
                  fontFamily: GraftTypography.systemFontFallback,
                  fontSize: 11,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  color: color,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// The customer's raised primary action: "+ Post Job"
class _CenterPostAction extends StatelessWidget {
  final VoidCallback? onTap;

  const _CenterPostAction({this.onTap});

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Post a Job',
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: GraftSpacing.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: GraftColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.add, size: 26, color: GraftColors.white),
              ),
              const SizedBox(height: 1),
              const Text(
                'Post Job',
                style: TextStyle(
                  fontFamily: GraftTypography.systemFontFallback,
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: GraftColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
