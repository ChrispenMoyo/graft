// GRAFT Customer - Job Detail Screen
// The customer's view of their own job (spec §6 + §19): the key facts,
// the job lifecycle, and an honest offers section - comparing and
// choosing workers arrives with the offers batch.

import 'package:flutter/material.dart';
import '../../../../../core/design_tokens/design_tokens.dart';
import '../../../../../core/widgets/buttons.dart';
import '../../../../../core/widgets/cards.dart';
import '../../../../../core/widgets/detail_section.dart';
import '../../../../../core/widgets/job_visuals.dart';
import '../../../../../core/widgets/trust_components.dart';
import '../../../../../models/job.dart';

/// Customer job detail screen
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
            icon: const Icon(Icons.edit_outlined),
            tooltip: 'Edit job',
            onPressed: onEdit,
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(GraftSpacing.lg),
              children: [
                // Category and status
                Row(
                  children: [
                    CategoryChip(category: job.category),
                    const Spacer(),
                    JobStatusBadge(status: job.status),
                  ],
                ),
                const SizedBox(height: GraftSpacing.md),

                // Title
                Text(
                  job.title,
                  style: GraftTypography.displaySmall.copyWith(
                    color: GraftColors.textPrimary,
                  ),
                ),
                const SizedBox(height: GraftSpacing.lg),

                // Budget highlight
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(GraftSpacing.lg),
                  decoration: BoxDecoration(
                    color: GraftColors.primary.withValues(alpha: 0.07),
                    borderRadius: BorderRadius.circular(GraftBorderRadius.md),
                    border: Border.all(
                      color: GraftColors.primary.withValues(alpha: 0.18),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'BUDGET',
                        style: const TextStyle(
                          fontFamily: GraftTypography.systemFontFallback,
                          fontSize: GraftTypography.labelSmallFontSize,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                          color: GraftColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: GraftSpacing.xs),
                      Text(
                        jobBudgetLabel(job),
                        style: GraftTypography.headlineMedium.copyWith(
                          color: GraftColors.primaryDark,
                        ),
                      ),
                      const SizedBox(height: GraftSpacing.xs),
                      Text(
                        job.pricingPreference.description,
                        style: GraftTypography.bodySmall.copyWith(
                          color: GraftColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: GraftSpacing.md),

                // Location
                DetailSection(
                  icon: Icons.place_outlined,
                  title: 'Location',
                  child: Text(job.location?.displayLocation ?? 'Not specified'),
                ),

                // Schedule
                if (formatSchedule(job.preferredDate, job.preferredTime) != null)
                  DetailSection(
                    icon: Icons.schedule_outlined,
                    title: 'Schedule',
                    child:
                        Text(formatSchedule(job.preferredDate, job.preferredTime)!),
                  ),

                // Description
                DetailSection(
                  icon: Icons.description_outlined,
                  title: 'Description',
                  child: Text(
                    job.description,
                    style: GraftTypography.bodyMedium.copyWith(
                      color: GraftColors.textPrimary,
                      height: 1.5,
                    ),
                  ),
                ),

                // Photos - only rendered when the job has photos
                if (job.photos.isNotEmpty) JobPhotoGallery(photos: job.photos),

                // Offers - comparing and choosing workers arrives with the
                // offers batch (spec §7). Honest until then.
                SectionHeader(title: 'Offers'),
                const SizedBox(height: GraftSpacing.md),
                ComingSoonNote(
                  message:
                      'No offers yet. When workers near ${job.location?.area ?? 'you'} respond to your job, you will compare their offers and choose here.',
                ),
                const SizedBox(height: GraftSpacing.xl),

                // Job lifecycle
                DetailSection(
                  icon: Icons.timeline,
                  title: 'Progress',
                  child: _JobTimeline(status: job.status),
                ),

                const SizedBox(height: GraftSpacing.sm),
                Text(
                  'Created ${_formatDateTime(job.createdAt)}',
                  style: GraftTypography.bodySmall.copyWith(
                    color: GraftColors.textMuted,
                  ),
                ),
              ],
            ),
          ),

          // Actions
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(GraftSpacing.lg),
              child: DestructiveButton(
                text: 'Delete Job',
                onPressed: () => _showDeleteDialog(context),
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
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
        content: const Text(
            'This action cannot be undone. Are you sure you want to delete this job?'),
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

/// The customer-facing job lifecycle (spec §19). Later stages light up
/// as the job moves through the marketplace.
class _JobTimeline extends StatelessWidget {
  final JobStatus status;

  const _JobTimeline({required this.status});

  static const _steps = [
    (JobStatus.posted, 'Posted'),
    (JobStatus.bidding, 'Receiving offers'),
    (JobStatus.workerSelected, 'Worker selected'),
    (JobStatus.workStarted, 'Work started'),
    (JobStatus.completed, 'Completed'),
  ];

  @override
  Widget build(BuildContext context) {
    // Index of the furthest stage this status has reached
    int currentIndex;
    switch (status) {
      case JobStatus.posted:
        currentIndex = 0;
        break;
      case JobStatus.bidding:
        currentIndex = 1;
        break;
      case JobStatus.workerSelected:
      case JobStatus.paymentPending:
      case JobStatus.paymentConfirmed:
      case JobStatus.workerEnRoute:
        currentIndex = 2;
        break;
      case JobStatus.workStarted:
      case JobStatus.workCompleted:
      case JobStatus.customerConfirmed:
      case JobStatus.paymentReleased:
        currentIndex = 3;
        break;
      case JobStatus.completed:
        currentIndex = 4;
        break;
      default:
        // Draft or a problem state - nothing has progressed yet
        currentIndex = -1;
    }

    return Column(
      children: [
        for (int i = 0; i < _steps.length; i++) ...[
          Row(
            children: [
              Container(
                width: GraftIcon.md,
                height: GraftIcon.md,
                decoration: BoxDecoration(
                  color: i <= currentIndex
                      ? GraftColors.primary
                      : GraftColors.surfaceVariant,
                  shape: BoxShape.circle,
                ),
                child: i < currentIndex
                    ? const Icon(
                        Icons.check,
                        size: 14,
                        color: GraftColors.white,
                      )
                    : null,
              ),
              const SizedBox(width: GraftSpacing.md),
              Expanded(
                child: Text(
                  _steps[i].$2,
                  style: GraftTypography.bodyMedium.copyWith(
                    color: i <= currentIndex
                        ? GraftColors.textPrimary
                        : GraftColors.textMuted,
                    fontWeight:
                        i == currentIndex ? FontWeight.w600 : FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          if (i < _steps.length - 1)
            Container(
              margin: const EdgeInsets.only(left: 6),
              width: 2,
              height: 14,
              color: i < currentIndex
                  ? GraftColors.primary
                  : GraftColors.surfaceVariant,
            ),
        ],
      ],
    );
  }
}
