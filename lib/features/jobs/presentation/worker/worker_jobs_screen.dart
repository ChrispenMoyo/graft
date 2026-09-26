// GRAFT Worker - Nearby Jobs Screen
// Job discovery list for workers: real jobs from the repository,
// sorted nearest first, with category filtering and all screen states.
// Responding/offering to a job is reserved for a later GRAFT batch.

import 'package:flutter/material.dart';
import '../../../../core/design_tokens/design_tokens.dart';
import '../../../../core/widgets/cards.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/error_state.dart';
import '../../../../core/widgets/job_visuals.dart';
import '../../../../core/widgets/skeleton.dart';
import '../../../../models/job.dart';
import '../../../../models/job_category.dart';
import '../../../../models/location.dart';
import '../../data/repositories/job_repository.dart';
import 'worker_job_detail_screen.dart';

/// Nearby jobs discovery screen for workers
class WorkerJobsScreen extends StatefulWidget {
  const WorkerJobsScreen({super.key});

  @override
  State<WorkerJobsScreen> createState() => _WorkerJobsScreenState();
}

class _WorkerJobsScreenState extends State<WorkerJobsScreen> {
  /// MVP location: live GPS is not wired yet, so a deterministic Harare
  /// location is used for proximity. Replaced when location services land.
  static const Location _defaultWorkerLocation = Location(
    latitude: -17.8267,
    longitude: 31.0327,
    city: 'Harare',
    suburb: 'CBD',
  );

  static const double _radiusKm = 10;

  bool _isLoading = true;
  bool _hasError = false;
  List<Job> _jobs = [];
  JobCategoryEnum? _selectedCategory;

  @override
  void initState() {
    super.initState();
    _loadJobs();
  }

  Future<void> _loadJobs() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    try {
      final jobs = await ServiceLocator.jobRepository.getNearbyJobs(
        workerLocation: _defaultWorkerLocation,
        radiusKm: _radiusKm,
      );
      if (!mounted) return;
      setState(() {
        _jobs = jobs;
        _isLoading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _hasError = true;
        _isLoading = false;
      });
    }
  }

  List<Job> get _filteredJobs {
    final category = _selectedCategory;
    if (category == null) return _jobs;
    return _jobs.where((job) => job.category == category.label).toList();
  }

  void _openJob(Job job) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => WorkerJobDetailScreen(
          job: job,
          workerLocation: _defaultWorkerLocation,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Nearby Jobs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadJobs,
            tooltip: 'Refresh',
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    if (_isLoading) {
      return SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.all(GraftSpacing.lg),
        child: Column(
          children: const [
            SizedBox(height: GraftSpacing.sm),
            SkeletonJobCard(),
            SizedBox(height: GraftSpacing.md),
            SkeletonJobCard(),
            SizedBox(height: GraftSpacing.md),
            SkeletonJobCard(),
          ],
        ),
      );
    }
    if (_hasError) {
      return ErrorState(
        message: 'We could not load jobs right now. Please try again.',
        onRetry: _loadJobs,
      );
    }

    return RefreshIndicator(
      onRefresh: _loadJobs,
      child: Column(
        children: [
          // Category filter chips
          SizedBox(
            height: 56,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(
                horizontal: GraftSpacing.lg,
                vertical: GraftSpacing.sm,
              ),
              children: [
                _buildFilterChip(
                  label: 'All',
                  isSelected: _selectedCategory == null,
                  onTap: () => _selectCategory(null),
                ),
                const SizedBox(width: GraftSpacing.sm),
                ...JobCategoryEnum.values.map((category) => Padding(
                      padding: const EdgeInsets.only(right: GraftSpacing.sm),
                      child: _buildFilterChip(
                        label: '${category.emoji} ${category.label}',
                        isSelected: _selectedCategory == category,
                        onTap: () => _selectCategory(category),
                      ),
                    )),
              ],
            ),
          ),

          // Jobs list
          Expanded(
            child: _filteredJobs.isEmpty
                ? ListView(
                    // Scrollable so the RefreshIndicator stays usable
                    children: [
                      const SizedBox(height: 120),
                      NoJobsWorkerEmptyState(onRefresh: _loadJobs),
                    ],
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(GraftSpacing.lg),
                    itemCount: _filteredJobs.length,
                    itemBuilder: (context, index) {
                      final job = _filteredJobs[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: GraftSpacing.md),
                        child: JobCard(
                          title: job.title,
                          category: job.category,
                          description: job.description,
                          area: job.location?.area ??
                              job.location?.suburb ??
                              job.location?.city,
                          distanceKm:
                              job.getDistanceFrom(_defaultWorkerLocation),
                          schedule: formatSchedule(
                              job.preferredDate, job.preferredTime),
                          budgetLabel: jobBudgetLabel(job),
                          status: job.status,
                          onTap: () => _openJob(job),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _selectCategory(JobCategoryEnum? category) {
    setState(() {
      // Tapping the selected chip clears the filter
      _selectedCategory = (_selectedCategory == category) ? null : category;
    });
  }

  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return FilterChip(
      selected: isSelected,
      label: Text(label),
      onSelected: (_) => onTap(),
      selectedColor: GraftColors.primary.withValues(alpha: 0.2),
      labelStyle: TextStyle(
        color: isSelected ? GraftColors.primary : GraftColors.textPrimary,
      ),
    );
  }
}
