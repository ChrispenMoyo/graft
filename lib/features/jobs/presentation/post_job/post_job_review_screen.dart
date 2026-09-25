// GRAFT Post Job - Review Screen
// Final step in the job posting flow - reviews all entered information

import 'package:flutter/material.dart';
import '../../../../../core/design_tokens/design_tokens.dart';
import '../../../../../core/widgets/buttons.dart';
import '../../../../../models/job.dart';

/// Review screen for post job flow
/// Displays all job details for final confirmation before posting
class PostJobReviewScreen extends StatelessWidget {
  final JobDraft jobDraft;
  final VoidCallback onEdit;
  final VoidCallback onPost;
  final VoidCallback onBack;

  /// True while the job is being published - disables the post button
  final bool isPosting;

  const PostJobReviewScreen({
    super.key,
    required this.jobDraft,
    required this.onEdit,
    required this.onPost,
    required this.onBack,
    this.isPosting = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Job'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: onBack,
        ),
      ),
      body: Column(
        children: [
          // Progress indicator
          Padding(
            padding: EdgeInsets.all(GraftSpacing.lg),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Step 6 of 6: '),
                Text(
                  'Review',
                  style: GraftTypography.headlineSmall.copyWith(
                    color: GraftColors.primary,
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: GraftSpacing.lg),
              child: ListView(
                padding: const EdgeInsets.only(bottom: GraftSpacing.xxxl),
                children: [
                  Text(
                    'Review Your Job Details',
                    style: GraftTypography.headlineLarge.copyWith(
                      color: GraftColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.sm),

                  Text(
                    'Please review all information before posting your job.',
                    style: GraftTypography.bodyMedium.copyWith(
                      color: GraftColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.xl),

                  // Job summary card
                  Card(
                    elevation: GraftElevation.level1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(GraftBorderRadius.md),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(GraftSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Job Summary',
                            style: GraftTypography.labelLarge.copyWith(
                              color: GraftColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: GraftSpacing.xs),

                          _buildSummaryRow('Category', jobDraft.category ?? 'Not selected'),
                          _buildSummaryRow('Title', jobDraft.title ?? 'Not provided'),
                          _buildSummaryRow(
                            'Description',
                            jobDraft.description ?? 'Not provided',
                          ),
                          _buildSummaryRow(
                            'Photos',
                            '${jobDraft.photos.length} of $maxJobPhotos photos',
                          ),
                          _buildSummaryRow(
                            'Location',
                            jobDraft.location != null
                                ? jobDraft.location!.displayLocation
                                : 'Not specified',
                          ),
                          _buildSummaryRow(
                            'Date',
                            jobDraft.preferredDate != null
                                ? '${jobDraft.preferredDate!.year}-${jobDraft.preferredDate!.month.toString().padLeft(2, '0')}-${jobDraft.preferredDate!.day.toString().padLeft(2, '0')}'
                                : 'Not specified',
                          ),
                          _buildSummaryRow(
                            'Time',
                            jobDraft.preferredTime != null
                                ? '${jobDraft.preferredTime!.hour.toString().padLeft(2, '0')}:${jobDraft.preferredTime!.minute.toString().padLeft(2, '0')}'
                                : 'Not specified',
                          ),
                          _buildSummaryRow(
                            'Pricing',
                            jobDraft.pricingPreference.label,
                          ),
                          _buildSummaryRow('Budget', jobDraft.budget != null ? 'USD \$${jobDraft.budget!.toStringAsFixed(2)}' : 'Not specified'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.lg),

                  // Important notes
                  Card(
                    elevation: GraftElevation.level1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(GraftBorderRadius.md),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(GraftSpacing.lg),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Important Notes',
                            style: GraftTypography.labelLarge.copyWith(
                              color: GraftColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: GraftSpacing.xs),
                          Text(
                            '• Once posted, you can communicate with interested workers',
                            style: GraftTypography.bodyMedium.copyWith(
                              color: GraftColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: GraftSpacing.xs),
                          Text(
                            '• Workers will see your job details and can contact you',
                            style: GraftTypography.bodyMedium.copyWith(
                              color: GraftColors.textSecondary,
                            ),
                          ),
                          const SizedBox(height: GraftSpacing.xs),
                          Text(
                            '• You can update or cancel this job as needed',
                            style: GraftTypography.bodyMedium.copyWith(
                              color: GraftColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: GraftSpacing.lg),

                  // Action buttons
                  TextButton.icon(
                    onPressed: onEdit,
                    icon: const Icon(Icons.edit, size: GraftIcon.md),
                    label: const Text('Edit Job Details'),
                    style: TextButton.styleFrom(
                      foregroundColor: GraftColors.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Post job button
          Padding(
            padding: EdgeInsets.all(GraftSpacing.lg),
            child: PrimaryButton(
              text: 'Post Job',
              onPressed: jobDraft.hasRequiredFields && !isPosting ? onPost : null,
              isLoading: isPosting,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              '$label:',
              style: GraftTypography.bodyMedium.copyWith(
                color: GraftColors.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: GraftTypography.bodyMedium.copyWith(
                color: GraftColors.textPrimary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}