// GRAFT Worker Profile
// The worker profile is a trust document, not a social-media profile
// (spec §8): who the worker is, their verification status, their
// services and their reputation. A new worker is shown honestly as new
// - ratings, reviews and verification build up as real work happens.

import 'package:flutter/material.dart';
import '../../../../core/design_tokens/design_tokens.dart';
import '../../../../core/session/session_manager.dart';
import '../../../../core/widgets/buttons.dart';
import '../../../../core/widgets/graft_logo.dart';
import '../../../../core/widgets/trust_components.dart';

/// Worker profile screen
class WorkerProfileScreen extends StatefulWidget {
  /// Called after the user signs out
  final VoidCallback? onSignOut;

  const WorkerProfileScreen({super.key, this.onSignOut});

  @override
  State<WorkerProfileScreen> createState() => _WorkerProfileScreenState();
}

class _WorkerProfileScreenState extends State<WorkerProfileScreen> {
  void _editName() {
    final controller =
        TextEditingController(text: SessionManager.instance.displayName ?? '');
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Your name'),
        content: TextField(
          controller: controller,
          autofocus: true,
          textCapitalization: TextCapitalization.words,
          decoration: const InputDecoration(
            hintText: 'e.g. Blessing Moyo',
          ),
        ),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              SessionManager.instance
                  .updateProfile(displayName: controller.text.trim());
              Navigator.of(context).pop();
              setState(() {});
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final session = SessionManager.instance;
    final phone = session.phoneNumber;
    final joined = session.joinedAt;
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const GraftLogo(
          size: 24,
          color: GraftColors.white,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(GraftSpacing.lg),
          children: [
            const SizedBox(height: GraftSpacing.sm),

            // Header: who the worker is on GRAFT
            Container(
              padding: const EdgeInsets.all(GraftSpacing.lg),
              decoration: BoxDecoration(
                color: GraftColors.surface,
                borderRadius: BorderRadius.circular(GraftBorderRadius.lg),
                border: Border.all(color: GraftColors.surfaceVariant),
              ),
              child: Row(
                children: [
                  GraftAvatar(name: session.displayName, radius: 32),
                  const SizedBox(width: GraftSpacing.lg),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: _editName,
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  session.displayName?.trim().isNotEmpty == true
                                      ? session.displayName!
                                      : 'Add your name',
                                  style: GraftTypography.headlineSmall.copyWith(
                                    color: session.displayName
                                                ?.trim()
                                                .isNotEmpty ==
                                            true
                                        ? GraftColors.textPrimary
                                        : GraftColors.primary,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: GraftSpacing.xs),
                              const Icon(
                                Icons.edit_outlined,
                                size: 14,
                                color: GraftColors.textMuted,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: GraftSpacing.xs),
                        Text(
                          phone ?? 'Phone number not set',
                          style: GraftTypography.bodyMedium.copyWith(
                            color: GraftColors.textSecondary,
                          ),
                        ),
                        const SizedBox(height: GraftSpacing.xs),
                        Text(
                          'Member since ${months[joined.month - 1]} ${joined.year}',
                          style: GraftTypography.bodySmall.copyWith(
                            color: GraftColors.textMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GraftSpacing.lg),

            // Reputation
            _TrustCard(
              title: 'Reputation',
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.star_rounded,
                              size: GraftIcon.lg,
                              color: GraftColors.warning,
                            ),
                            const SizedBox(width: GraftSpacing.xs),
                            Text(
                              'New',
                              style: GraftTypography.headlineMedium.copyWith(
                                color: GraftColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: GraftSpacing.xs),
                        Text(
                          'No rating yet - it appears after your first completed job',
                          style: GraftTypography.bodySmall.copyWith(
                            color: GraftColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: GraftSpacing.lg),

            // Verification checklist (spec §8)
            _TrustCard(
              title: 'Verification',
              child: Column(
                children: const [
                  TrustStatusRow(
                    label: 'Phone verified',
                    state: TrustVerificationState.pending,
                    pendingNote: 'Pending',
                  ),
                  TrustStatusRow(
                    label: 'Identity verified',
                    state: TrustVerificationState.unverified,
                  ),
                  TrustStatusRow(
                    label: 'Skills verified',
                    state: TrustVerificationState.unverified,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GraftSpacing.md),
            const ComingSoonNote(
              message:
                  'Verification arrives in a later GRAFT release. Verified workers win more jobs.',
            ),
            const SizedBox(height: GraftSpacing.lg),

            // Services the worker offers (spec §8)
            _TrustCard(
              title: 'Services',
              child: Text(
                'You have not added any services yet. Add the work you do - like plumbing, bathroom repairs or pipe installation - so customers know what to hire you for.',
                style: GraftTypography.bodyMedium.copyWith(
                  color: GraftColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: GraftSpacing.md),
            const ComingSoonNote(
              message:
                  'Adding services arrives in a later GRAFT release.',
            ),
            const SizedBox(height: GraftSpacing.lg),

            // Reviews from completed jobs
            _TrustCard(
              title: 'Reviews',
              child: Text(
                'Reviews from customers appear here after your completed jobs.',
                style: GraftTypography.bodyMedium.copyWith(
                  color: GraftColors.textSecondary,
                ),
              ),
            ),
            const SizedBox(height: GraftSpacing.xxxxl),

            // Sign out
            SecondaryButton(
              text: 'Sign out',
              icon: Icons.logout,
              onPressed: widget.onSignOut,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}

/// A titled card used for the trust sections of the profile
class _TrustCard extends StatelessWidget {
  final String title;
  final Widget child;

  const _TrustCard({required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(GraftSpacing.lg),
      decoration: BoxDecoration(
        color: GraftColors.surface,
        borderRadius: BorderRadius.circular(GraftBorderRadius.md),
        border: Border.all(color: GraftColors.surfaceVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GraftTypography.labelLarge.copyWith(
              color: GraftColors.textSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: GraftSpacing.md),
          child,
        ],
      ),
    );
  }
}
