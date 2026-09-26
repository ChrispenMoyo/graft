// GRAFT Welcome Screen
// Shows the GRAFT logo and explains the marketplace to new users

import 'package:flutter/material.dart';
import 'package:graft/core/design_tokens/design_tokens.dart';
import 'package:graft/core/widgets/graft_logo.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  void _onGetStarted(BuildContext context) {
    // Navigate to onboarding flow
    Navigator.of(context).pushReplacementNamed('/onboarding');
  }

  void _onSignIn(BuildContext context) {
    // Navigate to login
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GraftColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(GraftSpacing.xl),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // GRAFT Logo
              const GraftLogo(
                size: 120,
              ),
              const SizedBox(height: GraftSpacing.xxxl),

              // Brand name using Young Serif
              Text(
                'GRAFT',
                style: GraftTypography.displayLarge.copyWith(
                  color: GraftColors.primary,
                  height: 1.0,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: GraftSpacing.sm),

              // Tagline
              Text(
                "Zimbabwe's hyperlocal services marketplace",
                style: TextStyle(
                  fontFamily: GraftTypography.systemFontFallback,
                  fontSize: 16,
                  color: GraftColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: GraftSpacing.xxxl),

              // Main question - Customer role
              Text(
                'Need a job done?',
                style: GraftTypography.headlineLarge.copyWith(
                  color: GraftColors.textPrimary,
                ),
              ),
              const SizedBox(height: GraftSpacing.lg),

              // Customer option (informational - role determined during sign-in flow)
              Text(
                'You\'ll select your role during setup',
                style: TextStyle(
                  fontFamily: GraftTypography.systemFontFallback,
                  fontSize: 14,
                  color: GraftColors.textMuted,
                ),
              ),
              const SizedBox(height: GraftSpacing.xxxl),

              // Worker question
              Text(
                'Looking for work?',
                style: GraftTypography.headlineLarge.copyWith(
                  color: GraftColors.textPrimary,
                ),
              ),
              const SizedBox(height: GraftSpacing.lg),

              // Worker option (informational - role determined during sign-in flow)
              Text(
                'You\'ll select your role during setup',
                style: TextStyle(
                  fontFamily: GraftTypography.systemFontFallback,
                  fontSize: 14,
                  color: GraftColors.textMuted,
                ),
              ),
              const SizedBox(height: GraftSpacing.xxxl),

              // Get Started button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _onGetStarted(context),
                  child: const Text('Get Started'),
                ),
              ),
              const SizedBox(height: GraftSpacing.lg),

              // Sign in option for existing users
              TextButton(
                onPressed: () => _onSignIn(context),
                child: const Text('Already have an account? Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}