// GRAFT Worker Home Foundation
// Worker-facing landing page with nearby jobs discovery

import 'package:flutter/material.dart';
import '../../../core/design_tokens/design_tokens.dart';
import '../../../core/widgets/cards.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/graft_logo.dart';
import '../../../core/widgets/snackbar.dart';
import '../../../features/jobs/data/repositories/job_repository.dart';
import '../../../features/jobs/presentation/worker/worker_job_detail_screen.dart';
import '../../../models/job.dart';
import '../../../models/location.dart';

/// Worker Home Screen
/// Shows "What jobs can I do nearby?" with job discovery and active work
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

  bool _isLoadingJobs = true;
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
    setState(() => _isLoadingJobs = true);
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
      setState(() => _isLoadingJobs = false);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const GraftLogo(
          size: 24,
          color: GraftColors.white,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Profile is planned for a later GRAFT release
              GraftSnackbar.showInfo(
                context,
                'Profile will be available in a later GRAFT release.',
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(GraftSpacing.lg),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Greeting
                      Text(
                        'Hello!',
                        style: GraftTypography.displaySmall.copyWith(
                          color: GraftColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: GraftSpacing.sm),

                      // Primary question
                      Text(
                        "What jobs can I do nearby?",
                        style: GraftTypography.headlineLarge.copyWith(
                          color: GraftColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: GraftSpacing.lg),

                      // Availability toggle
                      const _AvailabilityToggle(),
                      const SizedBox(height: GraftSpacing.xxxl),

                      // Nearby jobs section
                      _NearbyJobsSection(
                        isLoading: _isLoadingJobs,
                        jobs: _nearbyJobs,
                        workerLocation: _workerLocation,
                        onJobTap: _openJob,
                        onViewAll: widget.onViewAllJobs,
                        onRefresh: _loadNearbyJobs,
                      ),
                      const SizedBox(height: GraftSpacing.xxxl),

                      // Active jobs section
                      const _ActiveJobsSection(
                        title: 'Active Work',
                      ),

                      // Extra space to ensure scrollability
                      const SizedBox(height: GraftSpacing.xxxl),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

/// Availability toggle for workers
/// MVP: the availability state is not persisted yet
class _AvailabilityToggle extends StatefulWidget {
  const _AvailabilityToggle();

  @override
  State<_AvailabilityToggle> createState() => _AvailabilityToggleState();
}

class _AvailabilityToggleState extends State<_AvailabilityToggle> {
  bool _isOnline = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.wifi, size: GraftIcon.lg, color: GraftColors.primary),
        const SizedBox(width: GraftSpacing.md),
        Expanded(
          child: Text(
            'Available',
            style: GraftTypography.headlineSmall.copyWith(
              color: GraftColors.textPrimary,
            ),
          ),
        ),
        Switch(
          value: _isOnline,
          onChanged: (value) {
            setState(() {
              _isOnline = value;
            });
          },
          activeThumbColor: GraftColors.primary,
        ),
      ],
    );
  }
}

/// Nearby jobs section widget for displaying real nearby jobs
class _NearbyJobsSection extends StatelessWidget {
  final bool isLoading;
  final List<Job> jobs;
  final Location workerLocation;
  final void Function(Job job) onJobTap;
  final VoidCallback? onViewAll;
  final VoidCallback onRefresh;

  const _NearbyJobsSection({
    required this.isLoading,
    required this.jobs,
    required this.workerLocation,
    required this.onJobTap,
    this.onViewAll,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Nearby Jobs',
          style: GraftTypography.headlineSmall.copyWith(
            color: GraftColors.textPrimary,
          ),
        ),
        const SizedBox(height: GraftSpacing.md),

        if (isLoading)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(GraftSpacing.lg),
              child: CircularProgressIndicator(),
            ),
          )
        else if (jobs.isEmpty)
          NoJobsWorkerEmptyState(
            onRefresh: onRefresh,
          )
        else
          ...jobs.take(3).map((job) {
            return Column(
              children: [
                JobCard(
                  title: job.title,
                  category: job.category,
                  area: job.location?.displayLocation ?? 'Location not set',
                  distance: job.getDistanceFrom(workerLocation),
                  budget: job.formattedBudget,
                  status: job.status.label,
                  onTap: () => onJobTap(job),
                ),
                const SizedBox(height: GraftSpacing.md),
              ],
            );
          }),

        // View all button
        if (onViewAll != null && jobs.length > 3)
          TextButton(
            onPressed: onViewAll,
            child: const Text('View all nearby jobs'),
          ),
      ],
    );
  }
}

/// Active jobs section for worker dashboard
/// Workers are assigned to jobs in a later GRAFT batch, so this is
/// intentionally empty for now.
class _ActiveJobsSection extends StatelessWidget {
  final String title;

  const _ActiveJobsSection({
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GraftTypography.headlineSmall.copyWith(
            color: GraftColors.textPrimary,
          ),
        ),
        const SizedBox(height: GraftSpacing.md),
        Text(
          'No active jobs. When you are selected for a job, it will appear here.',
          style: GraftTypography.bodyMedium.copyWith(
            color: GraftColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
