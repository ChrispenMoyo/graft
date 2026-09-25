// GRAFT Customer - Job Detail Screen
// Shows detailed information about a specific job

import 'package:flutter/material.dart';
import '../../../../../core/design_tokens/design_tokens.dart';
import '../../../../../core/widgets/buttons.dart';
import '../../../../../models/job.dart';

/// Customer job detail screen
/// Shows detailed view of a single job
class CustomerJobDetailScreen extends StatelessWidget {
  final Job job;
  final VoidCallback onBack;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const CustomerJobDetailScreen({
    super.key,
    required this.job,
    required this.onBack,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: onEdit,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => _showDeleteDialog(context),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(GraftSpacing.lg),
              children: [
                // Job title and status
                Text(
                  job.title,
                  style: GraftTypography.headlineLarge.copyWith(
                    color: GraftColors.textPrimary,
                  ),
                ),
                const SizedBox(height: GraftSpacing.sm),

                Chip(
                  label: Text(
                    job.status.label,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  backgroundColor: job.status.isActive
                      ? GraftColors.primary.withValues(alpha: 0.1)
                      : GraftColors.success.withValues(alpha: 0.1),
                ),
                const SizedBox(height: GraftSpacing.lg),

                // Description section
                _buildSection(
                  context,
                  icon: Icons.description,
                  title: 'Description',
                  child: Text(job.description),
                ),

                // Category section
                _buildSection(
                  context,
                  icon: Icons.category,
                  title: 'Category',
                  child: Text(job.category),
                ),

                // Price section
                _buildSection(
                  context,
                  icon: Icons.attach_money,
                  title: 'Pricing',
                  child: Text(job.formattedBudget),
                ),

                // Location section
                _buildSection(
                  context,
                  icon: Icons.location_on,
                  title: 'Location',
                  child: Text(job.location?.area ?? job.location?.city ?? 'Not specified'),
                ),

                // Schedule section
                _buildSection(
                  context,
                  icon: Icons.calendar_today,
                  title: 'Preferred Date',
                  child: Text(
                    job.preferredDate != null
                        ? '${job.preferredDate!.year}-${job.preferredDate!.month.toString().padLeft(2, '0')}-${job.preferredDate!.day.toString().padLeft(2, '0')}'
                        : 'Not specified',
                  ),
                ),

                _buildSection(
                  context,
                  icon: Icons.access_time,
                  title: 'Preferred Time',
                  child: Text(
                    job.preferredTime != null
                        ? '${job.preferredTime!.hour.toString().padLeft(2, '0')}:${job.preferredTime!.minute.toString().padLeft(2, '0')}'
                        : 'Not specified',
                  ),
                ),

                // Timeline section
                _buildSection(
                  context,
                  icon: Icons.timeline,
                  title: 'Job Timeline',
                  child: _buildTimeline(),
                ),

                // Created at
                const SizedBox(height: GraftSpacing.lg),
                Text(
                  'Created: ${_formatDateTime(job.createdAt)}',
                  style: GraftTypography.bodySmall.copyWith(
                    color: GraftColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),

          // Action buttons
          Padding(
            padding: EdgeInsets.all(GraftSpacing.lg),
            child: Column(
              children: [
                SecondaryButton(
                  text: 'Edit Job',
                  onPressed: onEdit,
                  width: double.infinity,
                ),
                const SizedBox(height: GraftSpacing.sm),
                DestructiveButton(
                  text: 'Delete Job',
                  onPressed: () => _showDeleteDialog(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Card(
      elevation: GraftElevation.level1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GraftBorderRadius.md),
      ),
      margin: const EdgeInsets.only(bottom: GraftSpacing.md),
      child: Padding(
        padding: const EdgeInsets.all(GraftSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: GraftIcon.md, color: GraftColors.primary),
                const SizedBox(width: GraftSpacing.sm),
                Text(
                  title,
                  style: GraftTypography.labelLarge.copyWith(
                    color: GraftColors.textPrimary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: GraftSpacing.sm),
            DefaultTextStyle(
              style: GraftTypography.bodyMedium.copyWith(
                color: GraftColors.textSecondary,
              ),
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    final statuses = [
      JobStatus.draft,
      JobStatus.posted,
      JobStatus.bidding,
      JobStatus.workerSelected,
      JobStatus.paymentPending,
    ];

    final titles = ['Created', 'Posted', 'Bidding', 'Worker Selected', 'Payment Pending'];
    final icons = [Icons.add, Icons.publish, Icons.album, Icons.person, Icons.payment];

    final int currentStepIndex;
    int tempIndex = 0;
    for (int i = 0; i < statuses.length; i++) {
      if (statuses[i] == job.status) {
        tempIndex = i;
        break;
      }
    }
    currentStepIndex = tempIndex;

    return Column(
      children: [
        for (int i = 0; i < statuses.length; i++) ...[
          Row(
            children: [
              Container(
                width: GraftIcon.lg,
                height: GraftIcon.lg,
                decoration: BoxDecoration(
                  color: i <= currentStepIndex ? GraftColors.primary : GraftColors.textMuted,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icons[i],
                  size: GraftIcon.sm,
                  color: GraftColors.white,
                ),
              ),
              const SizedBox(width: GraftSpacing.md),
              Expanded(
                child: Text(
                  titles[i],
                  style: GraftTypography.bodyMedium.copyWith(
                    color: i <= currentStepIndex ? GraftColors.textPrimary : GraftColors.textSecondary,
                  ),
                ),
              ),
            ],
          ),
          if (i < statuses.length - 1)
            const SizedBox(height: GraftSpacing.sm),
        ],
      ],
    );
  }

  String _formatDateTime(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }

  void _showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Job?'),
        content: const Text('This action cannot be undone. Are you sure you want to delete this job?'),
        actions: [
          TextButton(
            onPressed: Navigator.of(context).pop,
            child: const Text('Cancel'),
          ),
          DestructiveButton(
            text: 'Delete',
            onPressed: () {
              Navigator.of(context).pop();
              onDelete();
            },
          ),
        ],
      ),
    );
  }
}