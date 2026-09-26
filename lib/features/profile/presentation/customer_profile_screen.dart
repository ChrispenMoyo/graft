// GRAFT Customer Profile
// The customer's profile is a trust document (spec §9): who they are,
// how to reach them, their activity on GRAFT, and their verification
// status. Only real session data is shown - a new customer is shown as
// new, never with fabricated ratings or history.

import 'package:flutter/material.dart';
import '../../../../core/design_tokens/design_tokens.dart';
import '../../../../core/session/session_manager.dart';
import '../../../../core/widgets/buttons.dart';
import '../../../../core/widgets/graft_logo.dart';
import '../../../../core/widgets/trust_components.dart';
import '../../../../features/jobs/data/repositories/job_repository.dart';

/// Customer profile screen
class CustomerProfileScreen extends StatefulWidget {
  /// Called after the user signs out
  final VoidCallback? onSignOut;

  /// Changes when job data may have changed, prompting a reload of the
  /// activity stats
  final int dataVersion;

  const CustomerProfileScreen({
    super.key,
    this.onSignOut,
    this.dataVersion = 0,
  });

  @override
  State<CustomerProfileScreen> createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  Future<int>? _jobCountFuture;

  @override
  void initState() {
    super.initState();
    _jobCountFuture = _loadJobCount();
  }

  @override
  void didUpdateWidget(covariant CustomerProfileScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.dataVersion != widget.dataVersion) {
      setState(() {
        _jobCountFuture = _loadJobCount();
      });
    }
  }

  Future<int> _loadJobCount() async {
    final jobs = await ServiceLocator.jobRepository
        .getCustomerJobs(SessionManager.instance.customerId);
    return jobs.length;
  }

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
            hintText: 'e.g. Tendai Moyo',
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

            // Header: who the customer is on GRAFT
            Container(
              padding: const EdgeInsets.all(GraftSpacing.lg),
              decoration: BoxDecoration(
                color: GraftColors.surface,
                borderRadius: BorderRadius.circular(GraftBorderRadius.lg),
                border: Border.all(color: GraftColors.surfaceVariant),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      GraftAvatar(
                        name: session.displayName,
                        radius: 32,
                      ),
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
                                      style:
                                          GraftTypography.headlineSmall.copyWith(
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
                ],
              ),
            ),
            const SizedBox(height: GraftSpacing.lg),

            // Activity on GRAFT
            _TrustCard(
              title: 'Your activity',
              child: FutureBuilder<int>(
                future: _jobCountFuture,
                builder: (context, snapshot) {
                  final count = snapshot.data ?? 0;
                  return Row(
                    children: [
                      Expanded(
                        child: _StatBlock(
                          value: count > 0 ? '$count' : '0',
                          label: count == 1 ? 'job posted' : 'jobs posted',
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Column(
                            children: [
                              const Icon(
                                Icons.star_rounded,
                                size: GraftIcon.lg,
                                color: GraftColors.warning,
                              ),
                              const SizedBox(height: GraftSpacing.xs),
                              Text(
                                'No ratings yet',
                                style: GraftTypography.bodySmall.copyWith(
                                  color: GraftColors.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: GraftSpacing.lg),

            // Verification status
            _TrustCard(
              title: 'Verification',
              child: Column(
                children: const [
                  TrustStatusRow(
                    label: 'Phone number',
                    state: TrustVerificationState.pending,
                    pendingNote: 'Pending',
                  ),
                  TrustStatusRow(
                    label: 'Identity',
                    state: TrustVerificationState.unverified,
                  ),
                ],
              ),
            ),
            const SizedBox(height: GraftSpacing.md),
            const ComingSoonNote(
              message:
                  'Phone and identity verification arrive in a later GRAFT release. Verified details build trust with workers.',
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

/// One statistic in the activity row
class _StatBlock extends StatelessWidget {
  final String value;
  final String label;

  const _StatBlock({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: GraftTypography.headlineMedium.copyWith(
            color: GraftColors.textPrimary,
          ),
        ),
        const SizedBox(height: GraftSpacing.xs),
        Text(
          label,
          style: GraftTypography.bodySmall.copyWith(
            color: GraftColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
