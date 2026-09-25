// GRAFT Customer - Jobs List Screen
// Shows all jobs for a customer, with ability to create new job

import 'package:flutter/material.dart';
import '../../../../../core/design_tokens/design_tokens.dart';
import '../../../../../core/widgets/buttons.dart';
import '../../../../../models/job.dart';

/// Customer jobs list screen
/// Shows all jobs created by the customer
class CustomerJobsScreen extends StatelessWidget {
  final String customerId;
  final List<Job> jobs;
  final VoidCallback onNewJob;
  final void Function(Job job) onJobTap;

  const CustomerJobsScreen({
    super.key,
    required this.customerId,
    required this.jobs,
    required this.onNewJob,
    required this.onJobTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Jobs'),
        leading: const SizedBox.shrink(),
      ),
      body: Column(
        children: [
          // Jobs list
          Expanded(
            child: jobs.isEmpty
                ? _buildEmptyState(context)
                : ListView.builder(
                    padding: const EdgeInsets.all(GraftSpacing.lg),
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      final job = jobs[index];
                      return _buildJobCard(context, job);
                    },
                  ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onNewJob,
        label: const Text('New Job'),
        icon: const Icon(Icons.add),
        backgroundColor: GraftColors.primary,
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(GraftSpacing.xl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.work_outlined,
              size: GraftIcon.xxl,
              color: GraftColors.textMuted,
            ),
            const SizedBox(height: GraftSpacing.xl),
            Text(
              'No jobs yet',
              style: GraftTypography.headlineSmall.copyWith(
                color: GraftColors.textSecondary,
              ),
            ),
            const SizedBox(height: GraftSpacing.lg),
            Text(
              'Create your first job to get started',
              style: GraftTypography.bodyMedium.copyWith(
                color: GraftColors.textMuted,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: GraftSpacing.lg),
            PrimaryButton(
              text: 'Create Job',
              onPressed: onNewJob,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildJobCard(BuildContext context, Job job) {
    return Card(
      elevation: GraftElevation.level1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GraftBorderRadius.md),
      ),
      margin: const EdgeInsets.only(bottom: GraftSpacing.md),
      child: ListTile(
        onTap: () => onJobTap(job),
        contentPadding: const EdgeInsets.all(GraftSpacing.lg),
        leading: Container(
          width: GraftIcon.lg * 1.5,
          height: GraftIcon.lg * 1.5,
          decoration: BoxDecoration(
            color: GraftColors.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          ),
          child: const Icon(
            Icons.work,
            color: GraftColors.primary,
            size: GraftIcon.md,
          ),
        ),
        title: Text(
          job.title,
          style: GraftTypography.headlineSmall.copyWith(
            color: job.status.isActive ? GraftColors.primary : GraftColors.textPrimary,
          ),
        ),
        subtitle: Text(
          '${JobStatus.values[job.status.index].label} • ${_formatDate(job.createdAt)}',
          style: GraftTypography.bodySmall.copyWith(
            color: GraftColors.textSecondary,
          ),
        ),
        trailing: Chip(
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
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.month}/${date.day}/${date.year}';
  }
}