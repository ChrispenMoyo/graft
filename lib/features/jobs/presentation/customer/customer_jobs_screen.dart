// GRAFT Customer - Jobs List Screen
// Shows all jobs for a customer, newest first, using the shared Job
// Card. The empty state follows spec §14: what is empty, why, and what
// to do next.

import 'package:flutter/material.dart';
import '../../../../../core/design_tokens/design_tokens.dart';
import '../../../../../core/widgets/buttons.dart';
import '../../../../../core/widgets/cards.dart';
import '../../../../../core/widgets/job_visuals.dart';
import '../../../../../models/job.dart';

/// Customer jobs list screen
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
      body: jobs.isEmpty
          ? _buildEmptyState(context)
          : ListView.builder(
              padding: const EdgeInsets.all(GraftSpacing.lg),
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                final job = jobs[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: GraftSpacing.md),
                  child: JobCard(
                    title: job.title,
                    category: job.category,
                    description: job.description,
                    area: job.location?.area ??
                        job.location?.suburb ??
                        job.location?.city,
                    schedule:
                        formatSchedule(job.preferredDate, job.preferredTime),
                    budgetLabel: jobBudgetLabel(job),
                    status: job.status,
                    onTap: () => onJobTap(job),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: onNewJob,
        label: const Text('Post a Job'),
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
              Icons.work_outline,
              size: GraftIcon.xxl,
              color: GraftColors.textMuted,
            ),
            const SizedBox(height: GraftSpacing.xl),
            Text(
              'No jobs yet',
              style: GraftTypography.headlineSmall.copyWith(
                color: GraftColors.textPrimary,
              ),
            ),
            const SizedBox(height: GraftSpacing.md),
            Text(
              'Your jobs will appear here. Post your first job and start receiving offers.',
              style: GraftTypography.bodyMedium.copyWith(
                color: GraftColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: GraftSpacing.xl),
            PrimaryButton(
              text: 'Post a Job',
              onPressed: onNewJob,
            ),
          ],
        ),
      ),
    );
  }
}
