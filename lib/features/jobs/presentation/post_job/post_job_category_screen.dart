// GRAFT Post Job - Category Selection Screen
// First step in the job posting flow

import 'package:flutter/material.dart';
import '../../../../../core/design_tokens/design_tokens.dart';
import '../../../../../core/widgets/buttons.dart';
import '../../../../models/job_category.dart';

/// Category selection screen for post job flow
class PostJobCategoryScreen extends StatefulWidget {
  /// Category already chosen before opening the flow (pre-selected)
  final JobCategoryEnum? initialCategory;
  final void Function(JobCategoryEnum) onCategorySelected;
  final VoidCallback onBack;

  const PostJobCategoryScreen({
    super.key,
    this.initialCategory,
    required this.onCategorySelected,
    required this.onBack,
  });

  @override
  State<PostJobCategoryScreen> createState() => _PostJobCategoryScreenState();
}

class _PostJobCategoryScreenState extends State<PostJobCategoryScreen> {
  JobCategoryEnum? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.initialCategory;
  }

  void _onCategoryTap(JobCategoryEnum category) {
    setState(() {
      _selectedCategory = category;
    });
  }

  void _onNext() {
    if (_selectedCategory != null) {
      widget.onCategorySelected(_selectedCategory!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Category'),
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
                const Text('Step 1 of 6: '),
                Text(
                  'Category',
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'What kind of help do you need?',
                    style: GraftTypography.headlineLarge.copyWith(
                      color: GraftColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.lg),

                  // Category grid
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.only(bottom: GraftSpacing.xxxl),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: JobCategoryEnum.values.length,
                      itemBuilder: (context, index) {
                        final category = JobCategoryEnum.values[index];
                        return _CategoryCard(
                          category: category,
                          isSelected: _selectedCategory == category,
                          onTap: () => _onCategoryTap(category),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Next button
          Padding(
            padding: EdgeInsets.all(GraftSpacing.lg),
            child: PrimaryButton(
              text: 'Next',
              onPressed: _selectedCategory != null ? _onNext : null,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}

/// Category card widget
class _CategoryCard extends StatelessWidget {
  final JobCategoryEnum category;
  final bool isSelected;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        elevation: isSelected ? GraftElevation.level2 : GraftElevation.level1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(GraftBorderRadius.md),
          side: BorderSide(
            color: isSelected
                ? GraftColors.primary
                : GraftColors.surfaceVariant,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(GraftSpacing.lg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                category.emoji,
                style: const TextStyle(fontSize: 32),
              ),
              const SizedBox(height: GraftSpacing.md),
              Text(
                category.label,
                style: GraftTypography.headlineSmall.copyWith(
                  color: isSelected
                      ? GraftColors.primary
                      : GraftColors.textPrimary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}