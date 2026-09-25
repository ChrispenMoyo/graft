// GRAFT Post Job - Success Screen
// Shows confirmation that the job has been successfully posted

import 'package:flutter/material.dart';
import '../../../../../core/design_tokens/design_tokens.dart';
import '../../../../../core/widgets/buttons.dart';
import '../../../../../models/job.dart';

/// Success screen after job has been posted
class PostJobSuccessScreen extends StatelessWidget {
  final Job postedJob;
  final VoidCallback onDone;

  const PostJobSuccessScreen({
    super.key,
    required this.postedJob,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Posted'),
        // The Done button is the only way out of the success screen
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: GraftSpacing.xl),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Success icon
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        color: GraftColors.success.withValues(alpha: 0.1),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.check_circle,
                        size: GraftIcon.xxl,
                        color: GraftColors.success,
                      ),
                    ),
                    const SizedBox(height: GraftSpacing.xl),

                    // Success message
                    Text(
                      'Job Posted Successfully!',
                      style: GraftTypography.headlineLarge.copyWith(
                        color: GraftColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: GraftSpacing.lg),

                    // Job reference
                    Text(
                      'Job ID: ${postedJob.id}',
                      style: GraftTypography.bodyMedium.copyWith(
                        color: GraftColors.textSecondary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: GraftSpacing.lg),

                    // What's next
                    Text(
                      'What\'s next?',
                      style: GraftTypography.labelLarge.copyWith(
                        color: GraftColors.textPrimary,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: GraftSpacing.sm),

                    // Next steps
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildNextStep('Workers can contact you in the coming days'),
                        const SizedBox(height: GraftSpacing.sm),
                        _buildNextStep('Check your messages for worker offers'),
                        const SizedBox(height: GraftSpacing.sm),
                        _buildNextStep('Select a worker and coordinate details'),
                      ],
                    ),

                    const SizedBox(height: GraftSpacing.xl),
                  ],
                ),
              ),
            ),
          ),

          // Done button
          Padding(
            padding: EdgeInsets.all(GraftSpacing.lg),
            child: PrimaryButton(
              text: 'Done',
              onPressed: onDone,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNextStep(String step) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.check_circle,
          size: GraftIcon.md,
          color: GraftColors.success,
        ),
        const SizedBox(width: GraftSpacing.sm),
        Expanded(
          child: Text(
            step,
            style: GraftTypography.bodyMedium.copyWith(
              color: GraftColors.textPrimary,
            ),
          ),
        ),
      ],
    );
  }
}