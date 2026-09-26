// GRAFT Worker Home
// Answers the worker's first question: "Is there work near me right
// now?" (spec §4). An availability header (ONLINE / OFFLINE) sits above
// the nearby jobs list so the worker can scan opportunities and decide
// which ones are worth pursuing (spec §18).

import 'package:flutter/material.dart';
import '../../../core/design_tokens/design_tokens.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/cards.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/error_state.dart';
import '../../../core/widgets/job_visuals.dart';
import '../../../core/widgets/graft_logo.dart';
import '../../../core/widgets/skeleton.dart';
import '../../../core/widgets/trust_components.dart';
import '../../../features/jobs/data/repositories/job_repository.dart';
import '../../../features/jobs/presentation/post_job/post_job_flow.dart';
import '../../../features/jobs/presentation/worker/worker_job_detail_screen.dart';
import '../../../models/job.dart';
import '../../../models/location.dart';

/// Worker Home Screen
class WorkerHomeScreen extends StatefulWidget {
  /// Called when the user wants to see all nearby jobs (e.g. Jobs tab)
  final VoidCallback? onViewAllJobs;

  /// Changes when job data may have changed, prompting a reload
  final int dataVersion;

  const WorkerHomeScreen({
    super.key,
    this.onViewAllJobs,
    this.dataVersion = 0,
  });

  @override
  State<WorkerHomeScreen> createState() => _WorkerHomeScreenState();
}

class _WorkerHomeScreenState extends State<WorkerHomeScreen> {
  /// MVP location: live GPS is not wired yet, so a deterministic Harare
  /// location is used for proximity. Replaced when location services land.
  static const Location _workerLocation = Location(
    latitude: -17.8267, // Harare, Zimbabwe
    longitude: 31.0327,
    city: 'Harare',
    suburb: 'CBD',
  );

  bool _isOnline = true;
  bool _isLoadingJobs = true;
  bool _hasError = false;
  List<Job> _nearbyJobs = [];

  @override
  void initState() {
    super.initState();
    _loadNearbyJobs();
  }

  @override
  void didUpdateWidget(covariant WorkerHomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.dataVersion != widget.dataVersion) {
      _loadNearbyJobs();
    }
  }

  Future<void> _loadNearbyJobs() async {
    setState(() {
      _isLoadingJobs = true;
      _hasError = false;
    });
    try {
      final jobs = await ServiceLocator.jobRepository.getNearbyJobs(
        workerLocation: _workerLocation,
      );
      if (!mounted) return;
      setState(() {
        _nearbyJobs = jobs;
        _isLoadingJobs = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _hasError = true;
        _isLoadingJobs = false;
      });
    }
  }

  void _openJob(Job job) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WorkerJobDetailScreen(
          job: job,
          workerLocation: _workerLocation,
        ),
      ),
    );
  }

  void _postJobAsWorker() {
    Navigator.of(context).push(
      MaterialPageRoute(
        settings: const RouteSettings(name: '/post-job'),
        builder: (context) => PostJobFlow.fromSession(
          onJobPosted: () {
            if (mounted) {
              _loadNearbyJobs();
            }
          },
          role: 'Worker',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const GraftLogo(
          size: 24,
          color: GraftColors.white,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadNearbyJobs,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(GraftSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: GraftSpacing.sm),

                // Availability header
                _AvailabilityCard(
                  isOnline: _isOnline,
                  city: _workerLocation.city ?? 'your area',
                  onChanged: (online) => setState(() => _isOnline = online),
                ),
                const SizedBox(height: GraftSpacing.xxxxl),

                // Nearby jobs
                SectionHeader(
                  title: 'Nearby jobs',
                  actionLabel:
                      widget.onViewAllJobs != null && _nearbyJobs.length > 3
                          ? 'View all'
                          : null,
                  onAction: widget.onViewAllJobs,
                ),
                const SizedBox(height: GraftSpacing.md),

                if (_isLoadingJobs)
                  const SkeletonJobList(itemCount: 3)
                else if (_hasError)
                  InlineErrorState(
                    title: "Couldn't load nearby jobs",
                    description: 'Check your connection and try again.',
                    onRetry: _loadNearbyJobs,
                  )
                else if (_nearbyJobs.isEmpty)
                  NoJobsWorkerEmptyState(onRefresh: _loadNearbyJobs)
                else
                  ..._nearbyJobs.take(3).map((job) => Padding(
                        padding: const EdgeInsets.only(bottom: GraftSpacing.md),
                        child: JobCard(
                          title: job.title,
                          category: job.category,
                          description: job.description,
                          area: job.location?.area ??
                              job.location?.suburb ??
                              job.location?.city,
                          distanceKm: job.getDistanceFrom(_workerLocation),
                          schedule: formatSchedule(
                              job.preferredDate, job.preferredTime),
                          budgetLabel: jobBudgetLabel(job),
                          status: job.status,
                          isNew: _isNew(job),
                          onTap: () => _openJob(job),
                        ),
                      )),
                const SizedBox(height: GraftSpacing.xxxxl),

                // Active work - assigned jobs arrive in a later batch
                SectionHeader(title: 'Active work'),
                const SizedBox(height: GraftSpacing.md),
                ComingSoonNote(
                  message:
                      'When a customer selects you for a job, it will appear here so you can track it from offer to payment.',
                ),
                const SizedBox(height: GraftSpacing.xxxxl),

                // Workers can also need work done at home
                Center(
                  child: TertiaryButton(
                    text: 'Need work done at home? Post a job',
                    icon: Icons.add,
                    onPressed: _postJobAsWorker,
                  ),
                ),

                // Extra space so content clears the bottom bar comfortably
                const SizedBox(height: GraftSpacing.xxxxl),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// A job counts as new on the day it was posted
  bool _isNew(Job job) =>
      DateTime.now().difference(job.createdAt).inDays < 1;
}

/// The worker's availability header: ONLINE/OFFLINE pill, where they
/// are looking for work, and the switch that controls it.
/// MVP: the availability state is not persisted or broadcast yet.
class _AvailabilityCard extends StatelessWidget {
  final bool isOnline;
  final String city;
  final ValueChanged<bool> onChanged;

  const _AvailabilityCard({
    required this.isOnline,
    required this.city,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(GraftSpacing.lg),
      decoration: BoxDecoration(
        color: GraftColors.surface,
        borderRadius: BorderRadius.circular(GraftBorderRadius.lg),
        border: Border.all(
          color: isOnline
              ? GraftColors.success.withValues(alpha: 0.35)
              : GraftColors.surfaceVariant,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AvailabilityPill(isOnline: isOnline),
                const SizedBox(height: GraftSpacing.sm),
                Text(
                  isOnline
                      ? 'Looking for work near $city'
                      : 'Go online to get nearby job alerts',
                  style: GraftTypography.bodyMedium.copyWith(
                    color: GraftColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: GraftSpacing.md),
          Switch(
            value: isOnline,
            onChanged: onChanged,
            activeThumbColor: GraftColors.primary,
          ),
        ],
      ),
    );
  }
}
