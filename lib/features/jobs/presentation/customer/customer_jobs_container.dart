// GRAFT Customer - Jobs Container
// Loads the signed-in customer's jobs and wires the list and detail screens
// to the job repository

import 'package:flutter/material.dart';
import '../../../../../core/design_tokens/design_tokens.dart';
import '../../../../../core/session/session_manager.dart';
import '../../../../../core/widgets/error_state.dart';
import '../../../../../core/widgets/skeleton.dart';
import '../../../../../core/widgets/snackbar.dart';
import '../../../../../models/job.dart';
import '../../data/repositories/job_repository.dart';
import 'customer_job_detail_screen.dart';
import 'customer_jobs_screen.dart';

/// Loads and owns the customer jobs list state
class CustomerJobsContainer extends StatefulWidget {
  /// Called when the user wants to create a new job (e.g. switch to Post tab)
  final VoidCallback? onNewJob;

  const CustomerJobsContainer({
    super.key,
    this.onNewJob,
  });

  @override
  State<CustomerJobsContainer> createState() => _CustomerJobsContainerState();
}

class _CustomerJobsContainerState extends State<CustomerJobsContainer> {
  bool _isLoading = true;
  bool _hasError = false;
  List<Job> _jobs = [];

  String get _customerId => SessionManager.instance.customerId;

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
      final jobs = await ServiceLocator.jobRepository.getCustomerJobs(_customerId);
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
    // Refresh the list when returning from the detail screen
    if (mounted) {
      _loadJobs();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      // Skeleton job cards instead of a frozen spinner (spec §15)
      return Scaffold(
        appBar: AppBar(title: const Text('My Jobs'), leading: const SizedBox.shrink()),
        body: const SingleChildScrollView(
          padding: EdgeInsets.all(GraftSpacing.lg),
          child: Column(
            children: [
              SkeletonJobCard(),
              SizedBox(height: GraftSpacing.md),
              SkeletonJobCard(),
              SizedBox(height: GraftSpacing.md),
              SkeletonJobCard(),
            ],
          ),
        ),
      );
    }
    if (_hasError) {
      return Scaffold(
        body: ErrorState(
          message: 'We could not load your jobs. Please try again.',
          onRetry: _loadJobs,
        ),
      );
    }
    return CustomerJobsScreen(
      customerId: _customerId,
      jobs: _jobs,
      onNewJob: widget.onNewJob ?? () {},
      onJobTap: _openJobDetail,
    );
  }
}
