// GRAFT Onboarding Screen
// Introduces the marketplace to new users

import 'package:flutter/material.dart';
import 'package:graft/core/design_tokens/design_tokens.dart';
import 'package:graft/core/widgets/graft_logo.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;

  final List<_OnboardingPage> _pages = [
    _OnboardingPage(
      title: 'GRAFT',
      subtitle: 'Find Work. Get Work.',
      description: 'Zimbabwe\'s hyperlocal services marketplace',
      icon: Icons.work_outline,
    ),
    _OnboardingPage(
      title: 'Need a Job Done?',
      subtitle: 'You\'re a Customer',
      description: 'Post jobs and find reliable workers in your neighborhood.',
      icon: Icons.home_work,
    ),
    _OnboardingPage(
      title: 'Looking for Work?',
      subtitle: 'You\'re a Worker',
      description: 'Find nearby jobs and earn money from your skills.',
      icon: Icons.construction,
    ),
  ];

  void _onContinue() {
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GraftColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // GRAFT Logo in app bar area
            SizedBox(
              height: 80,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: GraftSpacing.xxxl),
                  child: const GraftLogo(
                    size: 60,
                  ),
                ),
              ),
            ),

            Expanded(
              child: PageView.builder(
                controller: PageController(initialPage: _currentIndex),
                itemCount: _pages.length,
                onPageChanged: (index) => setState(() => _currentIndex = index),
                itemBuilder: (context, index) => _pages[index],
              ),
            ),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: _pages.asMap().entries.map((entry) {
              return Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == entry.key
                      ? GraftColors.primary
                      : GraftColors.textMuted,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _onContinue,
              child: const Text('Get Started'),
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String description;
  final IconData icon;

  const _OnboardingPage({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 120,
            color: GraftColors.primary,
          ),
          const SizedBox(height: 40),
          Text(
            title,
            style: GraftTypography.headlineLarge.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            subtitle,
            style: GraftTypography.headlineMedium.copyWith(
              color: GraftColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Text(
            description,
            style: GraftTypography.bodyMedium.copyWith(
              color: GraftColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}