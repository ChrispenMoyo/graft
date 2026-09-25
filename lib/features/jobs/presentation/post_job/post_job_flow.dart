// GRAFT Post Job Flow
// Main flow screen that manages job draft state across all steps
// Uses proper Navigator push/pop for back/forward navigation

import 'package:flutter/material.dart';
import '../../../../models/job.dart';
import '../../../../models/job_category.dart';
import '../../../../core/session/session_manager.dart';
import '../../../../core/widgets/snackbar.dart';
import '../../../../features/jobs/data/repositories/job_repository.dart';
import 'post_job_category_screen.dart';
import 'post_job_details_screen.dart';
import 'post_job_photos_screen.dart';
import 'post_job_location_screen.dart';
import 'post_job_datetime_screen.dart';
import 'post_job_budget_screen.dart';
import 'post_job_review_screen.dart';
import 'post_job_success_screen.dart';

/// Post Job Flow - manages the entire posting workflow
/// Uses Navigator.push for forward navigation and Navigator.pop for backward
class PostJobFlow extends StatefulWidget {
  final String? customerId;
  final String? workerId;
  final VoidCallback? onJobPosted;

  /// Optional description captured before the flow was opened
  /// (e.g. typed on the customer home screen)
  final String? initialDescription;

  const PostJobFlow({
    super.key,
    this.customerId,
    this.workerId,
    this.onJobPosted,
    this.initialDescription,
  });

  /// Creates PostJobFlow with the current session user as the job owner
  factory PostJobFlow.fromSession({
    required VoidCallback onJobPosted,
    String? role,
  }) {
    return PostJobFlow(
      customerId: SessionManager.instance.currentUserId,
      onJobPosted: onJobPosted,
    );
  }

  @override
  State<PostJobFlow> createState() => _PostJobFlowState();
}

class _PostJobFlowState extends State<PostJobFlow> {
  late JobDraft _draft;
  bool _isPosting = false;

  @override
  void initState() {
    super.initState();
    _resetDraft();
  }

  void _resetDraft() {
    final initialDescription = widget.initialDescription;
    _draft = JobDraft(
      customerId: widget.customerId ?? SessionManager.instance.currentUserId,
      workerId: widget.workerId,
      description: (initialDescription != null && initialDescription.isNotEmpty)
          ? initialDescription
          : null,
    );
  }

  void _updateDraft(JobDraft newDraft) {
    setState(() {
      _draft = newDraft;
    });
  }

  /// Navigate forward to the next step using Navigator.push
  void _navigateToNextScreen(WidgetBuilder builder, String routeName) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: builder,
        settings: RouteSettings(name: routeName),
      ),
    );
  }

  /// Navigate backward using Navigator.pop
  void _goBack() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  /// Publish the job draft and show the success screen.
  /// Guards against duplicate submissions and missing required fields.
  Future<void> _publishJob() async {
    if (_isPosting || !_draft.hasRequiredFields) return;
    setState(() => _isPosting = true);

    try {
      final repository = ServiceLocator.jobRepository;
      final Job postedJob = await repository.publishJob(_draft);

      // Reset the flow so the next post starts fresh
      _resetDraft();

      if (!mounted) return;
      await Navigator.of(context).push(
        MaterialPageRoute(
          settings: const RouteSettings(name: '/post-job/success'),
          builder: (context) => PostJobSuccessScreen(
            postedJob: postedJob,
            onDone: () {
              // Close every post-job route and return to the screen that
              // opened the flow. (popUntil(isFirst) is not usable here:
              // MaterialApp keeps a '/' home route below the start screen.)
              Navigator.of(context).popUntil((route) {
                final name = route.settings.name ?? '';
                return !name.startsWith('/post-job');
              });
              widget.onJobPosted?.call();
            },
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;
      GraftSnackbar.showError(
        context,
        'We could not post your job. Please check your details and try again.',
      );
    } finally {
      if (mounted) {
        setState(() => _isPosting = false);
      } else {
        _isPosting = false;
      }
    }
  }

  /// Build a screen based on the current flow step
  Widget _buildScreen(String routeName) {
    if (routeName == '/post-job/details') {
      return PostJobDetailsScreen(
        category: JobCategoryEnum.values.firstWhere(
          (c) => c.label == _draft.category,
          orElse: () => JobCategoryEnum.other,
        ),
        onDetailsSubmitted: (title, description) {
          _updateDraft(_draft.copyWith(title: title, description: description));
          _navigateToNextScreen(
              (context) => _buildScreen('/post-job/photos'), '/post-job/photos');
        },
        onBack: _goBack,
      );
    }
    if (routeName == '/post-job/photos') {
      return PostJobPhotosScreen(
        existingPhotos: _draft.photos,
        onPhotosUpdated: (photos) {
          _updateDraft(_draft.copyWith(photos: photos));
        },
        onBack: _goBack,
        onNext: () => _navigateToNextScreen(
            (context) => _buildScreen('/post-job/location'), '/post-job/location'),
      );
    }
    if (routeName == '/post-job/location') {
      return PostJobLocationScreen(
        currentLocation: _draft.location,
        onLocationSelected: (location) {
          _updateDraft(_draft.copyWith(location: location));
          _navigateToNextScreen(
              (context) => _buildScreen('/post-job/datetime'), '/post-job/datetime');
        },
        onBack: _goBack,
      );
    }
    if (routeName == '/post-job/datetime') {
      return PostJobDateTimeScreen(
        selectedDate: _draft.preferredDate,
        selectedTime: _draft.preferredTime,
        onDateTimeSelected: (date, time) {
          _updateDraft(
              _draft.copyWith(preferredDate: date, preferredTime: time));
          _navigateToNextScreen(
              (context) => _buildScreen('/post-job/budget'), '/post-job/budget');
        },
        onBack: _goBack,
      );
    }
    if (routeName == '/post-job/budget') {
      return PostJobBudgetScreen(
        currentBudget: _draft.budget,
        currentPricingPreference: _draft.pricingPreference,
        onBudgetSelected: (budget, preference) {
          _updateDraft(
              _draft.copyWith(budget: budget, pricingPreference: preference));
          _navigateToNextScreen(
              (context) => _buildScreen('/post-job/review'), '/post-job/review');
        },
        onBack: _goBack,
      );
    }
    if (routeName == '/post-job/review') {
      return PostJobReviewScreen(
        jobDraft: _draft,
        isPosting: _isPosting,
        onEdit: _goBack,
        onPost: _publishJob,
        onBack: _goBack,
      );
    }
    // Category screen - first step of the flow
    return PostJobCategoryScreen(
      onCategorySelected: (category) {
        _updateDraft(_draft.copyWith(category: category.label));
        _navigateToNextScreen(
            (context) => _buildScreen('/post-job/details'), '/post-job/details');
      },
      onBack: _goBack,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Step screens provide their own Scaffold and AppBar; the flow
    // itself adds none so bars are not duplicated.
    return _buildScreen('/post-job');
  }
}
