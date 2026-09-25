// GRAFT Customer Home Foundation
// Customer-facing landing page with job creation focus

import 'package:flutter/material.dart';
import 'package:graft/features/jobs/presentation/post_job/post_job_flow.dart';
import '../../../core/design_tokens/design_tokens.dart';
import '../../../core/session/session_manager.dart';
import '../../../core/widgets/buttons.dart';
import '../../../core/widgets/cards.dart';
import '../../../core/widgets/empty_state.dart';
import '../../../core/widgets/forms.dart';
import '../../../core/widgets/graft_logo.dart';
import '../../../core/widgets/snackbar.dart';
import '../../../features/jobs/data/repositories/job_repository.dart';
import '../../../features/jobs/presentation/customer/customer_job_detail_screen.dart';
import '../../../models/job.dart';

/// Customer Home Screen
/// Shows "What do you need done?" with job creation and activity feeds
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
  final TextEditingController _descriptionController = TextEditingController();

  bool _isLoadingJobs = true;
  List<Job> _myJobs = [];

  // Sample categories for the demo
  static const List<Map<String, dynamic>> _popularCategories = [
    {'id': 'gardening', 'name': 'Gardening', 'icon': Icons.local_florist},
    {'id': 'plumbing', 'name': 'Plumbing', 'icon': Icons.plumbing},
    {'id': 'electrical', 'name': 'Electrical', 'icon': Icons.electric_meter},
    {'id': 'cleaning', 'name': 'Cleaning', 'icon': Icons.cleaning_services},
    {'id': 'carpentry', 'name': 'Carpentry', 'icon': Icons.house},
    {'id': 'painting', 'name': 'Painting', 'icon': Icons.brush},
  ];

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

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _loadMyJobs() async {
    setState(() => _isLoadingJobs = true);
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
      setState(() => _isLoadingJobs = false);
    }
  }

  void _openPostFlow({String? initialDescription}) {
    Navigator.of(context)
        .push(
          MaterialPageRoute(
            settings: const RouteSettings(name: '/post-job'),
            builder: (context) => PostJobFlow(
              initialDescription: initialDescription,
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
            icon: const Icon(Icons.notifications),
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
                        'Hi there!',
                        style: GraftTypography.displaySmall.copyWith(
                          color: GraftColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: GraftSpacing.sm),

                      // Primary question
                      Text(
                        'What do you need done?',
                        style: GraftTypography.headlineLarge.copyWith(
                          color: GraftColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: GraftSpacing.lg),

                      // Job description field - starts the post flow with it
                      GraftTextField(
                        controller: _descriptionController,
                        hint: 'Describe your job...',
                        maxLines: 3,
                      ),
                      const SizedBox(height: GraftSpacing.lg),

                      // Post job button
                      PrimaryButton(
                        text: 'Post a Job',
                        onPressed: () => _openPostFlow(
                          initialDescription:
                              _descriptionController.text.trim(),
                        ),
                        width: double.infinity,
                      ),
                      const SizedBox(height: GraftSpacing.xxxl),

                      // Popular categories section
                      Text(
                        'Popular Categories',
                        style: GraftTypography.headlineSmall.copyWith(
                          color: GraftColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: GraftSpacing.lg),

                      // Categories grid - scrollable for small screens
                      SizedBox(
                        height: 140,
                        child: GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: GraftSpacing.sm,
                          mainAxisSpacing: GraftSpacing.sm,
                          childAspectRatio: 0.9,
                          children: _popularCategories.map((category) {
                            return _CategoryCard(
                              id: category['id'],
                              name: category['name'],
                              icon: category['icon'],
                              onTap: () => _openPostFlow(),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: GraftSpacing.xxxl),

                      // Recent/Active jobs section
                      _JobsSection(
                        title: 'Your Active Jobs',
                        isLoading: _isLoadingJobs,
                        jobs: _myJobs,
                        onJobTap: _openJobDetail,
                        onViewAll: widget.onViewAllJobs,
                        onPostJob: () => _openPostFlow(),
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

/// Category card for popular categories
class _CategoryCard extends StatelessWidget {
  final String id;
  final String name;
  final IconData icon;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.id,
    required this.name,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: GraftElevation.level1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GraftBorderRadius.md),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(GraftSpacing.md),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: GraftIcon.md, color: GraftColors.primary),
              const SizedBox(height: GraftSpacing.xs),
              Text(
                name,
                style: TextStyle(
                  fontFamily: GraftTypography.systemFontFallback,
                  fontSize: GraftIcon.xs,
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

/// Jobs section widget for displaying the customer's real jobs
class _JobsSection extends StatelessWidget {
  final String title;
  final bool isLoading;
  final List<Job> jobs;
  final void Function(Job job) onJobTap;
  final VoidCallback? onViewAll;
  final VoidCallback onPostJob;

  const _JobsSection({
    required this.title,
    required this.isLoading,
    required this.jobs,
    required this.onJobTap,
    this.onViewAll,
    required this.onPostJob,
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

        // Loading, empty, or job cards
        if (isLoading)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(GraftSpacing.lg),
              child: CircularProgressIndicator(),
            ),
          )
        else if (jobs.isEmpty)
          NoJobsCustomerEmptyState(
            onPostJob: onPostJob,
          )
        else
          ...jobs.map((job) {
            return Column(
              children: [
                JobCard(
                  title: job.title,
                  category: job.category,
                  area: job.location?.displayLocation ?? 'Location not set',
                  budget: job.formattedBudget,
                  status: job.status.label,
                  onTap: () => onJobTap(job),
                ),
                const SizedBox(height: GraftSpacing.md),
              ],
            );
          }),

        // View all button
        if (onViewAll != null && jobs.length > 2) ...[
          TextButton(
            onPressed: onViewAll,
            child: const Text('View all jobs'),
          ),
        ],
      ],
    );
  }
}
