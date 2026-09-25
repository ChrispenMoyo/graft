// GRAFT Post Job - Details Screen
// Second step in the job posting flow

import 'package:flutter/material.dart';
import '../../../../../core/design_tokens/design_tokens.dart';
import '../../../../../core/widgets/buttons.dart';
import '../../../../../core/widgets/forms.dart';
import '../../../../models/job_category.dart';

/// Job details screen for post job flow
class PostJobDetailsScreen extends StatefulWidget {
  final JobCategoryEnum category;
  final void Function(String title, String description) onDetailsSubmitted;
  final VoidCallback onBack;

  const PostJobDetailsScreen({
    super.key,
    required this.category,
    required this.onDetailsSubmitted,
    required this.onBack,
  });

  @override
  State<PostJobDetailsScreen> createState() => _PostJobDetailsScreenState();
}

class _PostJobDetailsScreenState extends State<PostJobDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_formKey.currentState!.validate()) {
      widget.onDetailsSubmitted(
        _titleController.text.trim(),
        _descriptionController.text.trim(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Job Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: widget.onBack,
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
                const Text('Step 2 of 6: '),
                Text(
                  'Details',
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
              child: Form(
                key: _formKey,
                child: ListView(
                  padding: const EdgeInsets.only(bottom: GraftSpacing.xxxl),
                  children: [
                    // Category summary
                    Card(
                      elevation: GraftElevation.level1,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(GraftBorderRadius.md),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(GraftSpacing.lg),
                        child: Row(
                          children: [
                            const Icon(Icons.category, size: GraftIcon.md),
                            const SizedBox(width: GraftSpacing.sm),
                            Text(
                              'Category: ${widget.category.label}',
                              style: GraftTypography.bodyMedium.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: GraftSpacing.xl),

                    // Title field
                    Text(
                      'Job Title',
                      style: GraftTypography.labelLarge.copyWith(
                        color: GraftColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: GraftSpacing.xs),
                    GraftTextField(
                      controller: _titleController,
                      label: 'Enter a clear title',
                      hint: 'e.g., Fix leaking kitchen tap',
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Title is required';
                        }
                        if (value.trim().length < 5) {
                          return 'Title must be at least 5 characters';
                        }
                        if (value.trim().length > 100) {
                          return 'Title must be less than 100 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: GraftSpacing.lg),

                    // Description field
                    Text(
                      'Description',
                      style: GraftTypography.labelLarge.copyWith(
                        color: GraftColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: GraftSpacing.xs),
                    GraftTextField(
                      controller: _descriptionController,
                      label: 'Describe your job in detail',
                      hint: 'Include what needs to be done, any details, and what you expect',
                      maxLines: 5,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Description is required';
                        }
                        if (value.trim().length < 20) {
                          return 'Description must be at least 20 characters';
                        }
                        if (value.trim().length > 500) {
                          return 'Description must be less than 500 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: GraftSpacing.sm),

                    // Helper text
                    Text(
                      'The clearer your description, the better workers can understand and price your job.',
                      style: GraftTypography.bodySmall.copyWith(
                        color: GraftColors.textMuted,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Next button
          Padding(
            padding: EdgeInsets.all(GraftSpacing.lg),
            child: PrimaryButton(
              text: 'Next',
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _onNext();
                }
              },
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}