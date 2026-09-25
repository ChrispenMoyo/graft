// GRAFT Worker - Job Detail Screen
// Shows full job information to a worker who discovered the job.
// Responding/offering to a job is reserved for a later GRAFT batch.

import 'package:flutter/material.dart';
import '../../../../core/design_tokens/design_tokens.dart';
import '../../../../models/job.dart';
import '../../../../models/location.dart';

/// Worker job detail screen
/// Read-only view of a job the worker discovered nearby
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
    final meters = job.location!.calculateDistanceTo(workerLocation!);
    if (meters < 1000) return '${meters.round()} m away';
    return '${(meters / 1000).toStringAsFixed(1)} km away';
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

                // Location and distance
                _buildSection(
                  context,
                  icon: Icons.location_on,
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
                            color: GraftColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),

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
                  title: 'Budget',
                  child: Text(job.formattedBudget),
                ),

                // Schedule sections
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

                // Posted date
                const SizedBox(height: GraftSpacing.lg),
                Text(
                  'Posted: ${_formatDateTime(job.createdAt)}',
                  style: GraftTypography.bodySmall.copyWith(
                    color: GraftColors.textSecondary,
                  ),
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

  String _formatDateTime(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')} ${date.hour.toString().padLeft(2, '0')}:${date.minute.toString().padLeft(2, '0')}';
  }
}
