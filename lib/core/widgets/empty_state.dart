// GRAFT Empty State Widget
// Reusable empty state display for GRAFT

import 'package:flutter/material.dart';
import '../design_tokens/design_tokens.dart';
import 'buttons.dart';

/// GRAFT Empty State Widget
/// Shows when there is no content to display
class EmptyState extends StatelessWidget {
  final String title;
  final String? description;
  final VoidCallback? onAction;
  final String? actionButtonText;
  final IconData? icon;

  const EmptyState({
    super.key,
    required this.title,
    this.description,
    this.onAction,
    this.actionButtonText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(GraftSpacing.xxl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? Icons.inbox_outlined,
              size: GraftIcon.xxl,
              color: GraftColors.textMuted,
            ),
            const SizedBox(height: GraftSpacing.xxxl),
            Text(
              title,
              style: GraftTypography.headlineSmall.copyWith(
                color: GraftColors.textPrimary,
              ),
              textAlign: TextAlign.center,
            ),
            if (description != null) ...[
              const SizedBox(height: GraftSpacing.md),
              Text(
                description!,
                style: GraftTypography.bodyMedium.copyWith(
                  color: GraftColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
            if (onAction != null && actionButtonText != null) ...[
              const SizedBox(height: GraftSpacing.xxxl),
              PrimaryButton(
                text: actionButtonText!,
                onPressed: onAction,
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Pre-configured empty states for common use cases
class NoJobsEmptyState extends StatelessWidget {
  final VoidCallback? onRefresh;

  const NoJobsEmptyState({
    super.key,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      title: 'No jobs available yet',
      description: "We'll let you know when work becomes available in your area.",
      icon: Icons.work_outline,
      onAction: onRefresh,
      actionButtonText: 'Refresh',
    );
  }
}

/// Pre-configured empty state for customers
class NoJobsCustomerEmptyState extends StatelessWidget {
  final VoidCallback? onPostJob;

  const NoJobsCustomerEmptyState({
    super.key,
    this.onPostJob,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      title: 'No jobs posted yet',
      description: 'Post your first job and find someone nearby to help.',
      icon: Icons.work_outline,
      onAction: onPostJob,
      actionButtonText: 'Post a Job',
    );
  }
}

/// Pre-configured empty state for workers
class NoJobsWorkerEmptyState extends StatelessWidget {
  final VoidCallback? onRefresh;

  const NoJobsWorkerEmptyState({
    super.key,
    this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return EmptyState(
      title: 'No nearby jobs right now',
      description: 'New jobs will appear here when they match your skills and area.',
      icon: Icons.work_outline,
      onAction: onRefresh,
      actionButtonText: 'Refresh',
    );
  }
}
