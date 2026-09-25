// GRAFT Post Job - Date and Time Screen
// Fifth step in the job posting flow

import 'package:flutter/material.dart';
import '../../../../../core/design_tokens/design_tokens.dart';
import '../../../../../core/widgets/forms.dart';
import '../../../../../core/widgets/buttons.dart';

/// Date and time selection screen for post job flow
class PostJobDateTimeScreen extends StatefulWidget {
  final DateTime? selectedDate;
  final TimeOfDay? selectedTime;
  final void Function(DateTime date, TimeOfDay time) onDateTimeSelected;
  final VoidCallback onBack;

  const PostJobDateTimeScreen({
    super.key,
    this.selectedDate,
    this.selectedTime,
    required this.onDateTimeSelected,
    required this.onBack,
  });

  @override
  State<PostJobDateTimeScreen> createState() => _PostJobDateTimeScreenState();
}

class _PostJobDateTimeScreenState extends State<PostJobDateTimeScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate;
    _selectedTime = widget.selectedTime;
  }

  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
      helpText: 'Select preferred date',
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _pickTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime ?? TimeOfDay.now(),
      helpText: 'Select preferred time',
    );

    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  void _onNext() {
    if (_selectedDate != null && _selectedTime != null) {
      widget.onDateTimeSelected(_selectedDate!, _selectedTime!);
    }
  }

  String _formatDate(DateTime date) {
    return '${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}';
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');
    return '$hour:$minutes';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Preferred Date & Time'),
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
                const Text('Step 5 of 6: '),
                Text(
                  'Schedule',
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
                    'When would you like the job done?',
                    style: GraftTypography.headlineLarge.copyWith(
                      color: GraftColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.sm),

                  Text(
                    'This is your preferred time. Workers will see this when bidding.',
                    style: GraftTypography.bodyMedium.copyWith(
                      color: GraftColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.xl),

                  // Date selection
                  Text(
                    'Preferred Date',
                    style: GraftTypography.labelLarge.copyWith(
                      color: GraftColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.xs),
                  InputOutlinedButton(
                    onPressed: _pickDate,
                    label: _selectedDate != null
                        ? _formatDate(_selectedDate!)
                        : 'Select date',
                    icon: Icons.calendar_today,
                  ),
                  const SizedBox(height: GraftSpacing.xl),

                  // Time selection
                  Text(
                    'Preferred Time',
                    style: GraftTypography.labelLarge.copyWith(
                      color: GraftColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.xs),
                  InputOutlinedButton(
                    onPressed: _pickTime,
                    label: _selectedTime != null
                        ? _formatTime(_selectedTime!)
                        : 'Select time',
                    icon: Icons.access_time,
                  ),

                  const SizedBox(height: GraftSpacing.lg),

                  // Info card
                  Card(
                    elevation: GraftElevation.level1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(GraftBorderRadius.md),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(GraftSpacing.lg),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.info_outline,
                            size: GraftIcon.md,
                            color: GraftColors.info,
                          ),
                          const SizedBox(width: GraftSpacing.md),
                          Expanded(
                            child: Text(
                              'This is when you need the job completed. '
                              'Workers may contact you to confirm availability based on this timing.',
                              style: GraftTypography.bodySmall.copyWith(
                                color: GraftColors.textSecondary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: GraftSpacing.lg),

                  // Example
                  Text(
                    'Example:',
                    style: GraftTypography.labelLarge.copyWith(
                      color: GraftColors.textSecondary,
                    ),
                  ),
                  const SizedBox(height: GraftSpacing.xs),
                  Text(
                    'Today, 2:00 PM - Workers will know you prefer afternoon today',
                    style: GraftTypography.bodyMedium.copyWith(
                      color: GraftColors.textPrimary,
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
              onPressed: _selectedDate != null && _selectedTime != null ? _onNext : null,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }
}