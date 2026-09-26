// GRAFT Customer Home
// Task-first marketplace home (spec §3): a time-aware greeting, the
// primary question, the two primary actions, popular categories and
// the customer's active jobs. The customer never has to dig through
// screens to post a job - it is the first thing on the page.

import 'package:flutter/material.dart';
import 'package:graft/features/jobs/presentation/post_job/post_job_flow.dart';
import '../../../core/design_tokens/design_tokens.dart';
import '../../../core/session/session_manager.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/cards.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/error_state.dart';
import '../../../core/widgets/job_visuals.dart';
import '../../../core/widgets/graft_logo.dart';
import '../../../core/widgets/snackbar.dart';
import '../../../core/widgets/skeleton.dart';
import '../../../core/widgets/trust_components.dart';
import '../../../features/jobs/data/repositories/job_repository.dart';
import '../../../features/jobs/presentation/customer/customer_job_detail_screen.dart';
import '../../../models/job.dart';
import '../../../models/job_category.dart';

/// Customer Home Screen
class CustomerHomeScreen extends StatefulWidget {
  /// Called when the user wants to see all their jobs (e.g. switch to Jobs tab)
  final VoidCallback? onViewAllJobs;

  /// Changes when job data may have changed, prompting a reload
  final int dataVersion;

  const CustomerHomeScreen({
    super.key,
    this.onViewAllJobs,
    this.dataVersion = 0,
  });

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  bool _isLoadingJobs = true;
  bool _hasError = false;
  List<Job> _myJobs = [];

  @override
  void initState() {
    super.initState();
    _loadMyJobs();
  }

  @override
  void didUpdateWidget(covariant CustomerHomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.dataVersion != widget.dataVersion) {
      _loadMyJobs();
    }
  }

  Future<void> _loadMyJobs() async {
    setState(() {
      _isLoadingJobs = true;
      _hasError = false;
    });
    try {
      final jobs = await ServiceLocator.jobRepository
          .getCustomerJobs(SessionManager.instance.customerId);
      if (!mounted) return;
      setState(() {
        _myJobs = jobs;
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

  void _openPostFlow({JobCategoryEnum? category}) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            settings: const RouteSettings(name: '/post-job'),
            builder: (context) => PostJobFlow(
              initialCategory: category,
              onJobPosted: () {
                // The flow closes itself; show the new job in the Jobs tab
                if (!mounted) return;
                GraftSnackbar.showSuccess(context, 'Your job has been posted');
                widget.onViewAllJobs?.call();
              },
            ),
          ),
        )
        .then((_) => _loadMyJobs());
  }

  Future<void> _openJobDetail(Job job) async {
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CustomerJobDetailScreen(
          job: job,
          onBack: () => Navigator.of(context).pop(),
          onEdit: () {
            // Job editing is planned for a later GRAFT release
            GraftSnackbar.showInfo(
              context,
              'Editing a job will be available in a later GRAFT release.',
            );
          },
          onDelete: () async {
            try {
              await ServiceLocator.jobRepository.deleteJob(job.id);
            } catch (e) {
              if (context.mounted) {
                GraftSnackbar.showError(
                  context,
                  'We could not delete this job. Please try again.',
                );
              }
              return;
            }
            if (context.mounted) {
              Navigator.of(context).pop();
              GraftSnackbar.showSuccess(context, 'Job deleted');
            }
          },
        ),
      ),
    );
    if (mounted) {
      _loadMyJobs();
    }
  }

  /// "Good morning, Tendai" - time-aware, with the name when known.
  String get _greeting {
    final hour = DateTime.now().hour;
    final salutation = hour < 12
        ? 'Good morning'
        : hour < 17
            ? 'Good afternoon'
            : 'Good evening';
    final name = SessionManager.instance.displayName?.trim();
    return name == null || name.isEmpty ? salutation : '$salutation, $name';
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
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            tooltip: 'Notifications',
            onPressed: () {
              // Notifications are planned for a later GRAFT release
              GraftSnackbar.showInfo(
                context,
                'Notifications will be available in a later GRAFT release.',
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _loadMyJobs,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(GraftSpacing.lg),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: GraftSpacing.sm),

                // Greeting
                Text(
                  _greeting,
                  style: GraftTypography.displaySmall.copyWith(
                    color: GraftColors.textPrimary,
                  ),
                ),
                const SizedBox(height: GraftSpacing.xs),

                // Primary question
                Text(
                  'What do you need help with?',
                  style: GraftTypography.headlineLarge.copyWith(
                    color: GraftColors.textSecondary,
                  ),
                ),
                const SizedBox(height: GraftSpacing.xl),

                // Primary actions
                PrimaryButton(
                  text: 'Post a Job',
                  icon: Icons.add,
                  onPressed: () => _openPostFlow(),
                  width: double.infinity,
                ),
                const SizedBox(height: GraftSpacing.md),
                SecondaryButton(
                  text: 'Find a Worker',
                  icon: Icons.search,
                  onPressed: () {
                    // Browsing workers by area arrives with marketplace
                    // discovery in the next GRAFT release
                    GraftSnackbar.showInfo(
                      context,
                      'Browsing workers near you will be available in the next GRAFT release.',
                    );
                  },
                  width: double.infinity,
                ),
                const SizedBox(height: GraftSpacing.xxxxl),

                // Popular categories - each opens the post flow pre-selected
                Text(
                  'Popular categories',
                  style: GraftTypography.headlineSmall.copyWith(
                    color: GraftColors.textPrimary,
                  ),
                ),
                const SizedBox(height: GraftSpacing.lg),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: GraftSpacing.sm,
                  mainAxisSpacing: GraftSpacing.sm,
                  childAspectRatio: 1.15,
                  children: _homeCategories.map((category) {
                    return _CategoryTile(
                      label: category.label,
                      icon: GraftCategoryIcons.forCategory(category.label),
                      onTap: () => _openPostFlow(category: category),
                    );
                  }).toList(),
                ),
                const SizedBox(height: GraftSpacing.xxxxl),

                // Active jobs
                SectionHeader(
                  title: 'Your active jobs',
                  actionLabel:
                      widget.onViewAllJobs != null && _myJobs.length > 2
                          ? 'View all'
                          : null,
                  onAction: widget.onViewAllJobs,
                ),
                const SizedBox(height: GraftSpacing.md),

                if (_isLoadingJobs)
                  const SkeletonJobList(itemCount: 2)
                else if (_hasError)
                  InlineErrorState(
                    title: "Couldn't load your jobs",
                    description: 'Check your connection and try again.',
                    onRetry: _loadMyJobs,
                  )
                else if (_myJobs.isEmpty)
                  NoJobsCustomerEmptyState(onPostJob: () => _openPostFlow())
                else
                  ..._myJobs.map((job) => Padding(
                        padding: const EdgeInsets.only(bottom: GraftSpacing.md),
                        child: JobCard(
                          title: job.title,
                          category: job.category,
                          description: job.description,
                          area: job.location?.area ??
                              job.location?.suburb ??
                              job.location?.city,
                          schedule: formatSchedule(
                              job.preferredDate, job.preferredTime),
                          budgetLabel: jobBudgetLabel(job),
                          status: job.status,
                          isNew: _isNew(job),
                          onTap: () => _openJobDetail(job),
                        ),
                      )),

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

/// The six categories most useful on the customer home. All categories
/// remain available inside the post flow.
const List<JobCategoryEnum> _homeCategories = [
  JobCategoryEnum.plumbing,
  JobCategoryEnum.cleaning,
  JobCategoryEnum.electrical,
  JobCategoryEnum.gardening,
  JobCategoryEnum.handyman,
  JobCategoryEnum.painting,
];

/// Category tile for the home grid
class _CategoryTile extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _CategoryTile({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: GraftColors.surface,
      borderRadius: BorderRadius.circular(GraftBorderRadius.md),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(GraftBorderRadius.md),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(GraftBorderRadius.md),
            border: Border.all(color: GraftColors.surfaceVariant),
          ),
          padding: const EdgeInsets.all(GraftSpacing.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: GraftIcon.lg, color: GraftColors.primary),
              const SizedBox(height: GraftSpacing.sm),
              Text(
                label,
                style: const TextStyle(
                  fontFamily: GraftTypography.systemFontFallback,
                  fontSize: GraftTypography.labelMediumFontSize,
                  fontWeight: FontWeight.w500,
                  color: GraftColors.textPrimary,
                ),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
