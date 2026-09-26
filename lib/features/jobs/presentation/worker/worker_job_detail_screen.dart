// GRAFT Worker - Job Detail Screen
// Full job information for a worker who discovered the job nearby
// (spec §6). Everything needed to decide whether to pursue the job is
// on this screen: budget, location with distance, schedule, description
// and photos. Making offers arrives with the offers batch.

import 'package:flutter/material.dart';
import '../../../../core/design_tokens/design_tokens.dart';
import '../../../../core/widgets/buttons.dart';
import '../../../../core/widgets/cards.dart';
import '../../../../core/widgets/detail_section.dart';
import '../../../../core/widgets/job_visuals.dart';
import '../../../../core/widgets/snackbar.dart';
import '../../../../models/job.dart';
import '../../../../models/location.dart';

/// Worker job detail screen
class WorkerJobDetailScreen extends StatelessWidget {
  final Job job;

  /// The worker's current location, used to show how far away the job is
  final Location? workerLocation;

  const WorkerJobDetailScreen({
    super.key,
    required this.job,
    this.workerLocation,
  });

  String? get _distanceKm {
    if (workerLocation == null || !job.hasLocation) return null;
    final metres = job.location!.calculateDistanceTo(workerLocation!);
    if (metres < 1000) return '${metres.round()} m away';
    return '${(metres / 1000).toStringAsFixed(1)} km away';
  }

  void _makeOffer(BuildContext context) {
    // Offers are the next GRAFT batch (spec §26): show the CTA's real
    // state instead of pretending it works.
    GraftSnackbar.showInfo(
      context,
      'Making an offer will be available in the next GRAFT release.',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
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
                _BudgetHighlight(
                  budgetLabel: jobBudgetLabel(job),
                  pricingNote: job.pricingPreference.description,
                ),
                const SizedBox(height: GraftSpacing.md),

                // Location and distance
                DetailSection(
                  icon: Icons.place_outlined,
                  title: 'Location',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(job.location?.displayLocation ?? 'Not specified'),
                      if (_distanceKm != null) ...[
                        const SizedBox(height: GraftSpacing.xs),
                        Text(
                          _distanceKm!,
                          style: GraftTypography.bodyMedium.copyWith(
                            color: GraftColors.primaryDark,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

                // Schedule
                if (formatSchedule(job.preferredDate, job.preferredTime) !=
                    null)
                  DetailSection(
                    icon: Icons.schedule_outlined,
                    title: 'Schedule',
                    child: Text(formatSchedule(
                        job.preferredDate, job.preferredTime)!),
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
                if (job.photos.isNotEmpty)
                  JobPhotoGallery(photos: job.photos),

                // Posted footer
                const SizedBox(height: GraftSpacing.sm),
                Text(
                  'Posted ${_formatDateTime(job.createdAt)}',
                  style: GraftTypography.bodySmall.copyWith(
                    color: GraftColors.textMuted,
                  ),
                ),
              ],
            ),
          ),

          // Primary action
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.all(GraftSpacing.lg),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SecondaryButton(
                    text: 'Make an Offer',
                    onPressed: () => _makeOffer(context),
                    width: double.infinity,
                  ),
                ],
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
}

/// The budget highlight card at the top of the job detail
class _BudgetHighlight extends StatelessWidget {
  final String budgetLabel;
  final String pricingNote;

  const _BudgetHighlight({
    required this.budgetLabel,
    required this.pricingNote,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(GraftSpacing.lg),
      decoration: BoxDecoration(
        color: GraftColors.primary.withValues(alpha: 0.07),
        borderRadius: BorderRadius.circular(GraftBorderRadius.md),
        border: Border.all(
          color: GraftColors.primary.withValues(alpha: 0.18),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BUDGET',
                  style: TextStyle(
                    fontFamily: GraftTypography.systemFontFallback,
                    fontSize: GraftTypography.labelSmallFontSize,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5,
                    color: GraftColors.textSecondary,
                  ),
                ),
                const SizedBox(height: GraftSpacing.xs),
                Text(
                  budgetLabel,
                  style: GraftTypography.headlineMedium.copyWith(
                    color: GraftColors.primaryDark,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: GraftSpacing.md),
          Expanded(
            child: Text(
              pricingNote,
              style: GraftTypography.bodySmall.copyWith(
                color: GraftColors.textSecondary,
              ),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
